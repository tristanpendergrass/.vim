# Tristan's .vim files

Install in the home directory for unix systems and might work right out of
the box.

## Installation

    cd ~
    git clone --recursive http://github.com/tristanpendergrass/.vim

This will install the files along with all the submodules in the `bundle`
directory which contain my plugins.

It is also important to put a symlink in place so that the `.vimrc` is available
in the home directory (at least I think it's important?)

    ln -s ~/.vim/.vimrc ~/.vimrc

## Adding Plugins

I use [Pathogen](https://github.com/tpope/vim-pathogen), so simply putting the
appropriate plugin into the `/bundle` directory is sufficient to make it work.

If the plugin is already a git repo (nearly all of them are), then the proper way
to install is:

    git submodule add http://github.com/someuser/some-vim-plugin bundle/some-vim-plugin

Then commit and push.
