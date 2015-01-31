import os
import unittest
from inspect import getfile, currentframe

import autoload.vim_ember_cli_test_runner as sut


class VimEmberCliTestRunnerTests(unittest.TestCase):

    def test_get_name_of_current_test_group_returns_desired_string_in_js_file(self):
        current_line_1 = 7
        current_line_2 = 17
        current_buffer = self.build_buffer_helper("dummy_test_file.js")
        result_1 = sut.get_name_of_current_test_group(current_line_1, current_buffer, "module")
        result_2 = sut.get_name_of_current_test_group(current_line_2, current_buffer, "module")
        self.assertEqual("Module 1", result_1)
        self.assertEqual("Module 2", result_2)

    def test_get_name_of_current_test_group_returns_desired_string_in_coffee_file(self):
        current_line_1 = 7
        current_line_2 = 17
        current_buffer = self.build_buffer_helper("dummy_test_file.coffee")
        result_1 = sut.get_name_of_current_test_group(current_line_1, current_buffer, "module")
        result_2 = sut.get_name_of_current_test_group(current_line_2, current_buffer, "module")
        self.assertEqual("Module 1", result_1)
        self.assertEqual("Module 2", result_2)

    def test_get_name_of_current_test_returns_desired_string_in_js_file(self):
        current_line_1 = 7
        current_line_2 = 17
        current_buffer = self.build_buffer_helper("dummy_test_file.js")
        result_1 = sut.get_name_of_current_test_group(current_line_1, current_buffer, "test")
        result_2 = sut.get_name_of_current_test_group(current_line_2, current_buffer, "test")
        self.assertEqual("test example1a", result_1)
        self.assertEqual("test example2a", result_2)

    def test_get_name_of_current_test_returns_desired_string_in_coffee_file(self):
        current_line_1 = 7
        current_line_2 = 17
        current_buffer = self.build_buffer_helper("dummy_test_file.coffee")
        result_1 = sut.get_name_of_current_test_group(current_line_1, current_buffer, "test")
        result_2 = sut.get_name_of_current_test_group(current_line_2, current_buffer, "test")
        self.assertEqual("test example1a", result_1)
        self.assertEqual("test example2b", result_2)

    def build_buffer_helper(self, file_name):
        current_dir = os.path.dirname(os.path.abspath(getfile(currentframe())))
        with open("{}/{}".format(current_dir, file_name), "r") as f:
            current_buffer = []
            for line in f.readlines():
                current_buffer.append(line)
        return current_buffer
