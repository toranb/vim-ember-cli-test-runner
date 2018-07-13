import re

line_regex = {
    "module": re.compile(r"^module"),
    "test": re.compile(r"^\s*test")}

name_regex = {
    "module": re.compile(r"(?:module(ForAcceptance)?\(?([\"']?\s?[\"']?)(.*)(?:[\"']\)?),?;?)"),
    "test": re.compile(r"(?:test\(?[\"']?\s?[\"']?)(.*)(?:[\"',],)")}

capture_group = {
    "module": 3,
    "test": 1}


def get_name_of_current_test_group(current_line_index, current_buffer, desired_test_group):
    for line_num in range(current_line_index - 1, -1, -1):
        if line_regex[desired_test_group].search(current_buffer[line_num]) is not None:
            module_name = name_regex[desired_test_group].search(current_buffer[line_num])
            return module_name.group(capture_group[desired_test_group])
