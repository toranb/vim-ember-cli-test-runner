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
function! RunEmberCliTest()
python << endOfPython

current_line_index = vim.current.window.cursor[0]
current_buffer = vim.current.buffer
test_name = get_name_of_current_test(current_line_index, current_buffer)
if int(vim.eval("exists(':Dispatch')")) != 0:
    vim.command('Dispatch ember test --filter "{}"'.format(test_name))
else:
    vim.command('echo "The test runner requires vim-dispatch"')

endOfPython
endfunction

function! RunEmberCliTestModule()
python << endOfPython

current_line_index = vim.current.window.cursor[0]
current_buffer = vim.current.buffer
module_name = get_name_of_current_module(current_line_index, current_buffer)
if int(vim.eval("exists(':Dispatch')")) != 0:
    vim.command('Dispatch ember test --module "{}"'.format(module_name))
else:
    vim.command('echo "The test runner requires vim-dispatch"')

endOfPython
endfunction

function! RunAllEmberCliTests()
python << endOfPython

if int(vim.eval("exists(':Dispatch')")) != 0:
    vim.command('Dispatch ember test')
else:
    vim.command('echo "The test runner requires vim-dispatch"')

endOfPython
endfunction
" --------------------------------
"  Expose our commands to the user
" --------------------------------
command! RunAllEmberTests call RunAllEmberCliTests()
command! RunSingleEmberTest call RunEmberCliTest()
command! RunSingleEmberTestModule call RunEmberCliTestModule()
