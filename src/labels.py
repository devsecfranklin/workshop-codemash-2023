import re
import gidgethub
from gidgethub import routing

from . import util

router = routing.Router()

ISSUE_RE = re.compile(r"(?P<kind>bpo|gh)-(?P<issue>\d+)", re.IGNORECASE)
SKIP_ISSUE_LABEL = util.skip_label("issue")
STATUS_CONTEXT = "bot/issue-number"
# Try to keep descriptions at or below 50 characters, else GitHub's CSS will truncate it.
SKIP_ISSUE_STATUS = util.create_status(STATUS_CONTEXT, util.StatusState.SUCCESS,
                                       description="Issue report skipped")

@router.register("pull_request", action="labeled")
async def new_label(event, gh, *args, **kwargs):
    """Update the status if the "skip issue" label was added."""
    if util.label_name(event.data) == SKIP_ISSUE_LABEL:
        issue_number_found = ISSUE_RE.search(event.data["pull_request"]["title"])
        if issue_number_found:
            status = create_success_status(issue_number_found.group("issue"))
        else:
            status = SKIP_ISSUE_STATUS
        await util.post_status(gh, event, status)


@router.register("pull_request", action="unlabeled")
async def removed_label(event, gh, *args, session, **kwargs):
    """Re-check the status if the "skip issue" label is removed."""
    if util.no_labels(event.data):
        return
    elif util.label_name(event.data) == SKIP_ISSUE_LABEL:
        await set_status(event, gh, session=session)
