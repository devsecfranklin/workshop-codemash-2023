"""GCP Cloud Function - workshop-codemash-2023"""

import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger()
logger.setLevel(logging.INFO)


class GithubHelper:
    """Functions for interacting with GitHub."""

    # Instance variables
    pr_number = ""
    user = ""
    repo = ""
    ref = ""
    commit_sha = ""

    def __init__(
        self,
        pr_number=None,
        user=None,
        repo=None,
        ref=None,
        commit_sha=None,
        label_name=None,
    ):
        self.pr_number = ""
        self.resource_groups = ""
        self.user = ""
        self.repo = ""
        self.ref = ""
        self.commit_sha = ""
        self.label_name = label_name

    def check_json_fields(self, request_json):
        """Ensure all the JSON fields are present, etc."""
        logger.info("Check JSON fields in GH msg.")

        if "pr_number" in request_json:
            self.pr_number = str(request_json["pr_number"])
            logger.info("PR Number found in commit: %s", self.pr_number)
        else:
            logger.info("No pr_number found in request.")
        if "user" in request_json:
            self.user = str(request_json["user"])
            logger.info("Username found in commit: %s", self.user)
        else:
            logger.info("No user found in request.")
        if "repo" in request_json:
            self.repo = str(request_json["repo"])
            logger.info("Github repo name found: %s", self.repo)
        else:
            logger.info("No repo found in request.")
        if "ref" in request_json:
            self.ref = str(request_json["ref"])
            logger.info("ref: %s", self.ref)
        else:
            logger.info("No ref found in request.")
        if "commit_sha" in request_json:
            self.commit_sha = str(request_json["commit_sha"])
            logger.info("Commit SHA found: %s", self.commit_sha)
        else:
            logger.info("No commit_sha found in request.")

        logger.info("Completed check JSON fields in GH msg.")

    def add_commit_comment(self, g, comment):
        """Add a comment to a GitHub Commit."""
        logger.info(
            "Cloudbot adding comment on repo %s to PR %s",
            self.repo,
            self.pr_number,
        )

        repo = g.get_repo(str(self.repo))
        pr = repo.get_pull(int(self.pr_number))
        pr.create_issue_comment(comment)

        logger.info("Finished adding comment to PR %s", self.pr_number)

    def check_pr_label(self, g):
        """Check PR label.

        This will tell you if the label exists in the repo.

        If not, it gets create and set on the PR.
        """
        action = False
        logger.info("Check PR label %s", self.label_name)

        repo = g.get_repo(str(self.repo))
        pr = repo.get_pull(int(self.pr_number))
        labels = pr.get_labels()

        for thing in labels:
            logger.debug("Found a label: %s", thing)
            my_label_name = 'Label(name="' + self.label_name + '")'
            logger.debug("Comparing %s and %s", thing, my_label_name)
            if str(thing) == my_label_name:
                action = True
                logger.debug("Found a matching label!")

        if action is False:
            logger.info("Setting label %s on PR %s", self.label_name, self.pr_number)
            pr.set_labels(str(self.label_name))

        return action

    def create_label(self, g):
        """Create a label on a repo."""
        logger.info("Create label %s on repo %s", self.label_name, self.repo)

        try:
            repo = g.get_repo(self.repo)
            color = "a742f5"
            repo.create_label(self.label_name, color)
        except Exception as e:
            logger.info("Unable to add label %s because: %s", self.label_name, e)

    def get_pr_labels(self, g):
        """Get Pr labels."""
        logger.info("Get PR labels.")

    def assign_pr(self, g):
        """Assign the PR automatically."""
        logger.info("The PR will be assigned to the person who opened it.")
        repo = g.get_repo(self.repo)
        pr = repo.get_pull(int(self.pr_number))
        pr.add_to_assignees(self.user)

    def set_pr_labels(self):
        """Set the exact labels you want on the PR.

        For example you could get all labels, remove them, and then re-add only the right ones.
        """
        # pr.set_labels("tekton-testing")

    def check_pr_for_files(self, g):
        """Check comment for string

        Args:
            g ([type]): [description]
            string ([type]): [description]
        """
        logger.info("t: %s", string)
        repo = g.get_repo(self.repo)
        pr = repo.get_pull(int(self.pr_number))

        commits = pr.get_commits()
        for commit in commits:
            files = commit.files
            for file in files:
                filename = file.filename
                # contents = repo.get_contents(filename, ref=commit.sha).decoded_content
                logger.info("Found filename: %s", str(filename))

    def check_comment_for_string(self, g, string):
        """Check comment for string

        Args:
            g ([type]): [description]
            string ([type]): [description]
        """
        logger.info("Looking for string in comment: %s", string)
        repo = g.get_repo(self.repo)
        # pr = repo.get_pull(int(self.pr_number))

    def open_terraform_pr(self, g):
        """If there is a /terraform/modules/panorama directory, import the goodies.

        Args:
            g ([type]): [description]
        """
        repo = repo = g.get_repo(self.repo)
        body = """
        SUMMARY:
        Add in Panorama Module.

        TESTS:
          - [x] Send 'GET' request
          - [x] Send 'POST' request with/without body
        """
        pr = repo.create_pull(
            title="Use 'requests' instead of 'httplib'",
            body=body,
            head="develop",
            base="master",
        )
        # PullRequest(title="Use 'requests' instead of 'httplib'", number=664)


"""
Authors:      Franklin D. <devsecfranklin@duck.com>
Description:  Github Functions
Requirements: src/requirements.txt
Python:       Version 3.9.x
"""
