import sys


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
