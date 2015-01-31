command! RunAllEmberTests call vim_ember_cli_test_runner#RunEmberCliTests('all_tests')
command! RunSingleEmberTest call vim_ember_cli_test_runner#RunEmberCliTests('test')
command! RunSingleEmberTestModule call vim_ember_cli_test_runner#RunEmberCliTests('module')
command! RerunLastEmberTests call vim_ember_cli_test_runner#RerunLastEmberCliTests()
