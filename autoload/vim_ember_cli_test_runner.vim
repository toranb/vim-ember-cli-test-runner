" --------------------------------
" Add our plugin to the path
" --------------------------------
python import sys
python import vim
python sys.path.append(vim.eval('expand("<sfile>:h")'))
python from vim_ember_cli_test_runner import get_name_of_current_test_group

" --------------------------------
"  Function(s)
" --------------------------------
function! vim_ember_cli_test_runner#RunEmberCliTests(desired_test_group)
python << endOfPython

current_line_index = vim.current.window.cursor[0]
current_buffer = vim.current.buffer
desired_test_group = vim.eval("a:desired_test_group")

_query_string_value = {
    'test': lambda: get_name_of_current_test_group(current_line_index, current_buffer, desired_test_group),
    'module': lambda: get_name_of_current_test_group(current_line_index, current_buffer, desired_test_group),
    'all_tests': lambda: ""
}

_cli_command = {
    'test': 'ember test --filter',
    'module': 'ember test --filter',
    'all_tests': "ember test"
}

if int(vim.eval("exists(':Dispatch')")) != 0:
    vim.command("let g:last_ember_test_command = 'Dispatch {} \"{}\"'".format(_cli_command[desired_test_group], _query_string_value[desired_test_group]()))
    vim.command('Dispatch {} "{}"'.format(_cli_command[desired_test_group], _query_string_value[desired_test_group]()))
else:
    vim.command('echo "The test runner requires vim-dispatch"')

endOfPython
endfunction

function! vim_ember_cli_test_runner#RerunLastEmberCliTests()
    if exists("g:last_ember_test_command")
        exe g:last_ember_test_command
    else
        echo "You must first run tests grasshopper before you can rerun them."
    endif
endfunction
