# vim-ember-cli-test-runner

If you are a Vim user and write Ember apps using ember-cli then this plugin is
for you. With this plugin you can run all of the tests for your Ember project,
a single module of tests, or one individual test all without leaving your Vim buffer.

## The Plugin in Action

The gif shows tests written in CoffeeScript but this plugin will work for both JavaScript and CoffeeScript.

![vim-ember-cli](https://cloud.githubusercontent.com/assets/4416952/5118321/298c3f84-7026-11e4-9023-7d2d1d64858b.gif)

## Requirements

You will need to have [vim-dispatch](https://github.com/tpope/vim-dispatch)
installed for this plugin to run the tests in an asynchronous manner.

## Usage

The plugin provides three commands:

``` text
RunAllEmberTests
RunSingleEmberTest
RunSingleEmberTestModule
RerunLastEmberTests
```

Ensure that your cursor is within a module or test as appropriate for the
desired command that you are trying to run.


## Installation

Use your plugin manager of choice.

- [Pathogen](https://github.com/tpope/vim-pathogen)
  - `git clone https://github.com/JarrodCTaylor/vim-ember-cli-test-runner ~/.vim/bundle/vim-ember-cli-test-runner`
- [Vundle](https://github.com/gmarik/vundle)
  - Add `Bundle 'https://github.com/JarrodCTaylor/vim-ember-cli-test-runner'` to .vimrc
  - Run `:BundleInstall`
- [NeoBundle](https://github.com/Shougo/neobundle.vim)
  - Add `NeoBundle 'https://github.com/JarrodCTaylor/vim-ember-cli-test-runner'` to .vimrc
  - Run `:NeoBundleInstall`
- [vim-plug](https://github.com/junegunn/vim-plug)
  - Add `Plug 'https://github.com/JarrodCTaylor/vim-ember-cli-test-runner'` to .vimrc
  - Run `:PlugInstall`
