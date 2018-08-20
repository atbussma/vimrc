"
"   .vimrc Master
"
"   Author:     Alexander T. Bussmann
"   Copyright:  Copyright (C) Alexander T. Bussmann
"   Description:
"       - depends on a $HOME environment variable being defined instead of using $USERPROFILE directly
"       - depends on a $HOME/.vim folder existing for additional .vimrc files to be loaded
"       - vim for Windows also requires a $HOME/vimfiles folder for additional vim configuration customizations
"       - new configuration is either (modular configuration):
"               - grouped together into a related file and added as a .vimrc.<grouping> file under $HOME/.vim
"               - added to an existing grouping file under $HOME/.vim
"

"
"   default encodings set before all other actions
"       - prevents listchars E474 Invalid Argument errors on Windows
"
scriptencoding utf-8
:set encoding=utf-8
:set fileencoding=utf-8
:set termencoding=utf-8

"
"   load all vim bundles
"
execute pathogen#infect()
:set nocompatible

"
"   load all custom vim scripts first
"
"   {DEBUG TIP}
"       use ":scriptnames" to display the list of scripts loaded
"       use ":map" to display the list of all mappings defined
"
" Scripts {

    "
    "   .vimrc.color:  default color/syntax rules
    "
    if filereadable( $HOME . "/.vim/.vimrc.color" )
        source $HOME/.vim/.vimrc.color
    endif


    "
    "   .vimrc.clipboard:  all default clipboard rules
    "
    if filereadable( $HOME . "/.vim/.vimrc.clipboard" )
        source $HOME/.vim/.vimrc.clipboard
    endif


    "
    "   .vimrc.indentation:  all default indenting rules
    "
    if filereadable( $HOME . "/.vim/.vimrc.indentation" )
        source $HOME/.vim/.vimrc.indentation
    endif


    "
    "   .vimrc.visual:  all default visual rules
    "
    if filereadable( $HOME . "/.vim/.vimrc.visual" )
        source $HOME/.vim/.vimrc.visual
    endif


    "
    "   .vimrc.search:  all default search rules
    "
    if filereadable( $HOME . "/.vim/.vimrc.search" )
        source $HOME/.vim/.vimrc.search
    endif


    "
    "   .vimrc.environment:  all default environment rules
    "
    if filereadable( $HOME . "/.vim/.vimrc.environment" )
        source $HOME/.vim/.vimrc.environment
    endif


    "
    "   .vimrc.sourcecode:  all default source code rules
    "
    if filereadable( $HOME . "/.vim/.vimrc.sourcecode" )
        source $HOME/.vim/.vimrc.sourcecode
    endif

" }  // Scripts


"   auto-reload .vimrc when changed to avoid needing to reopen vim
autocmd! bufwritepost .vimrc source %
