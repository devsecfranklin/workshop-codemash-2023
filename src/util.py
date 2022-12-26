import sys

def create_status(context, state, *, description=None, target_url=None):
    """Create the data for a status.
    The argument order is such that you can use functools.partial() to set the
    context to avoid repeatedly specifying it throughout a module.
    """
    status = {
        "context": context,
        "state": state.value,
    }
    if description is not None:
        status["description"] = description
    if target_url is not None:
        status["target_url"] = target_url

    return status


def labels(issue):
    return {label_data["name"] for label_data in issue["labels"]}


def label_name(event_data):
    """Get the label name from a label-related webhook event."""
    return event_data["label"]["name"]


def no_labels(event_data):
    if "label" not in event_data:
        print(
            "no 'label' key in payload; "
            "'unlabeled' event triggered by label deletion?",
            file=sys.stderr,
        )
        return True
    else:
        return False
