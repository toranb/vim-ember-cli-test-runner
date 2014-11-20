" --------------------------------
" Add our plugin to the path
" --------------------------------
python import sys
python import vim
python sys.path.append(vim.eval('expand("<sfile>:h")'))
python from vim_ember_cli_test_runner import get_name_of_current_module, get_name_of_current_test

" --------------------------------
"  Function(s)
" --------------------------------
function! RunEmberCliTests(desired_test_group)
python << endOfPython

current_line_index = vim.current.window.cursor[0]
current_buffer = vim.current.buffer
desired_test_group = vim.eval("a:desired_test_group")

_query_string_value = {
    'single_test': lambda: get_name_of_current_test(current_line_index, current_buffer),
    'single_module': lambda: get_name_of_current_module(current_line_index, current_buffer),
    'all_tests': lambda: ""
}

_cli_command = {
    'single_test': 'ember test --filter',
    'single_module': 'ember test --module',
    'all_tests': "ember test"
}

if int(vim.eval("exists(':Dispatch')")) != 0:
    vim.command('Dispatch {} "{}"'.format(_cli_command[desired_test_group], _query_string_value[desired_test_group]()))
else:
    vim.command('echo "The test runner requires vim-dispatch"')

endOfPython
endfunction

" --------------------------------
"  Expose our commands to the user
" --------------------------------
command! RunAllEmberTests call RunEmberCliTests('all_tests')
command! RunSingleEmberTest call RunEmberCliTests('single_test')
command! RunSingleEmberTestModule call RunEmberCliTests('single_module')
