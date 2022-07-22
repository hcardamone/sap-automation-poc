import json
import jsondiff
from deepdiff import DeepDiff, grep
# from deepdiff import DeepSearch, grep
from pprint import pprint
from robot.api import logger


class JsonCompareError(Exception):
    pass


def dictionaries_should_be_equal(response, expectation):
    union = jsondiff.patch(response, expectation)
    difference = jsondiff.diff(response, union)
    if difference:
        raise JsonCompareError("Diff found: {}".format(difference))
    else:
        return True


def compare_json_payloads(response_json, expected_json):
    logger.debug("Compare JSON payloads")
    diff = DeepDiff(response_json, expected_json, ignore_order=True, verbose_level=2)
    logger.debug("Values changed: {}".format(diff['values_changed']))
    return diff.to_dict()


def json_payloads_should_match(response_json, expected_json):
    diff = DeepDiff(response_json, expected_json, verbose_level=2)
    if diff != {}:
        raise JsonCompareError("Payloads do not match! Differences: {}".format(diff))
    else:
        return True
