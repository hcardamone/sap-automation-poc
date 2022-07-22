import json
import jsondiff
from deepdiff import DeepDiff, grep
# from deepdiff import DeepSearch, grep
from pprint import pprint
from robot.api import logger


class JSONLibraryExtended(object):

    def append_value_json_obj(self, json_obj, key, value):
            json_obj[key]=value
            return json_obj

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

# https://dig.codes/example/compare-two-json-responses-on-robot-framework
# https://stackoverflow.com/questions/36916304/comparing-json-result-from-a-function-in-robot-framework
