import re


def get_name_of_current_module(current_line_index, current_buffer):
    module_line_regex = re.compile(r"^module")
    module_name_regex = re.compile(r"(?:module\(?[\"']?\s?[\"']?)(.*)(?:[\"']\)?,?;?)")
    for line_num in xrange(current_line_index - 1, -1, -1):
        if module_line_regex.search(current_buffer[line_num]) is not None:
            module_name = module_name_regex.search(current_buffer[line_num])
            return module_name.group(1)
    return False


def get_name_of_current_test(current_line_index, current_buffer):
    test_line_regex = re.compile(r"^test")
    test_name_regex = re.compile(r"(?:test\(?[\"']?\s?[\"']?)(.*)(?:[\",],)")
    for line_num in xrange(current_line_index - 1, -1, -1):
        if test_line_regex.search(current_buffer[line_num]) is not None:
            test_name = test_name_regex.search(current_buffer[line_num])
            return test_name.group(1)
    return False
