" vim:foldmethod=marker:fen:
scriptencoding utf-8

" Saving 'cpoptions' {{{
let s:save_cpo = &cpo
set cpo&vim
" }}}

" Functions {{{

let s:key_typed_ex = 'key typed'
lockvar s:key_typed_ex


" utility functions
" s:warn {{{
function! s:warn(msg)
    echohl WarningMsg
    echomsg a:msg
    echohl None

    call add(s:debug_errmsg, a:msg)
endfunction
" }}}
" s:warnf {{{
function! s:warnf(fmt, ...)
    call s:warn(call('printf', [a:fmt] + a:000))
endfunction
" }}}


function! cmdwincomplete#complete(findstart, base) "{{{
    if a:findstart
        " TODO
        return 0
    else
        try
            if s:complete_ex_p()
                call s:do_complete_ex(a:base)
            else
                call s:do_complete_eval(a:base)
            endif
        catch /^key typed$/
            " nop
        endtry
        return ''
    endif
endfunction "}}}


function! s:complete_ex_p() "{{{
    let curcol = col('.')
    return strpart(getline('.'), 0, curcol) =~# '^\s*$'
endfunction "}}}

function! s:do_complete_ex(base) "{{{
    call feedkeys("\<C-x>\<C-v>", 'n')

    return

    call s:complete_add(a:base, '!')
    call s:complete_add(a:base, '!!')
    call s:complete_add(a:base, '#')
    call s:complete_add(a:base, '&')
    call s:complete_add(a:base, '<')
    call s:complete_add(a:base, '=')
    call s:complete_add(a:base, '>')
    call s:complete_add(a:base, '@')
    call s:complete_add(a:base, '@@')
    call s:complete_add(a:base, 'Next')
    call s:complete_add(a:base, 'Print')
    call s:complete_add(a:base, 'X')
    call s:complete_add(a:base, 'abbreviate')
    call s:complete_add(a:base, 'abclear')
    call s:complete_add(a:base, 'aboveleft')
    call s:complete_add(a:base, 'all')
    call s:complete_add(a:base, 'amenu')
    call s:complete_add(a:base, 'anoremenu')
    call s:complete_add(a:base, 'append')
    call s:complete_add(a:base, 'argadd')
    call s:complete_add(a:base, 'argdelete')
    call s:complete_add(a:base, 'argdo')
    call s:complete_add(a:base, 'argedit')
    call s:complete_add(a:base, 'argglobal')
    call s:complete_add(a:base, 'arglocal')
    call s:complete_add(a:base, 'args')
    call s:complete_add(a:base, 'argument')
    call s:complete_add(a:base, 'ascii')
    call s:complete_add(a:base, 'augroup')
    call s:complete_add(a:base, 'aunmenu')
    call s:complete_add(a:base, 'autocmd')
    call s:complete_add(a:base, 'bNext')
    call s:complete_add(a:base, 'badd')
    call s:complete_add(a:base, 'ball')
    call s:complete_add(a:base, 'bdelete')
    call s:complete_add(a:base, 'behave')
    call s:complete_add(a:base, 'belowright')
    call s:complete_add(a:base, 'bfirst')
    call s:complete_add(a:base, 'blast')
    call s:complete_add(a:base, 'bmodified')
    call s:complete_add(a:base, 'bnext')
    call s:complete_add(a:base, 'botright')
    call s:complete_add(a:base, 'bprevious')
    call s:complete_add(a:base, 'break')
    call s:complete_add(a:base, 'breakadd')
    call s:complete_add(a:base, 'breakdel')
    call s:complete_add(a:base, 'breaklist')
    call s:complete_add(a:base, 'brewind')
    call s:complete_add(a:base, 'browse')
    call s:complete_add(a:base, 'bufdo')
    call s:complete_add(a:base, 'buffer')
    call s:complete_add(a:base, 'buffers')
    call s:complete_add(a:base, 'bunload')
    call s:complete_add(a:base, 'bwipeout')
    call s:complete_add(a:base, 'cNext')
    call s:complete_add(a:base, 'cNfile')
    call s:complete_add(a:base, 'cabbrev')
    call s:complete_add(a:base, 'cabclear')
    call s:complete_add(a:base, 'caddbuffer')
    call s:complete_add(a:base, 'caddexpr')
    call s:complete_add(a:base, 'caddfile')
    call s:complete_add(a:base, 'call')
    call s:complete_add(a:base, 'catch')
    call s:complete_add(a:base, 'cbuffer')
    call s:complete_add(a:base, 'cc')
    call s:complete_add(a:base, 'cclose')
    call s:complete_add(a:base, 'cd')
    call s:complete_add(a:base, 'center')
    call s:complete_add(a:base, 'cexpr')
    call s:complete_add(a:base, 'cfile')
    call s:complete_add(a:base, 'cfirst')
    call s:complete_add(a:base, 'cgetbuffer')
    call s:complete_add(a:base, 'cgetexpr')
    call s:complete_add(a:base, 'cgetfile')
    call s:complete_add(a:base, 'change')
    call s:complete_add(a:base, 'changes')
    call s:complete_add(a:base, 'chdir')
    call s:complete_add(a:base, 'checkpath')
    call s:complete_add(a:base, 'checktime')
    call s:complete_add(a:base, 'clast')
    call s:complete_add(a:base, 'clist')
    call s:complete_add(a:base, 'close')
    call s:complete_add(a:base, 'cmap')
    call s:complete_add(a:base, 'cmapclear')
    call s:complete_add(a:base, 'cmenu')
    call s:complete_add(a:base, 'cnewer')
    call s:complete_add(a:base, 'cnext')
    call s:complete_add(a:base, 'cnfile')
    call s:complete_add(a:base, 'cnoreabbrev')
    call s:complete_add(a:base, 'cnoremap')
    call s:complete_add(a:base, 'cnoremenu')
    call s:complete_add(a:base, 'colder')
    call s:complete_add(a:base, 'colorscheme')
    call s:complete_add(a:base, 'comclear')
    call s:complete_add(a:base, 'command')
    call s:complete_add(a:base, 'compiler')
    call s:complete_add(a:base, 'confirm')
    call s:complete_add(a:base, 'continue')
    call s:complete_add(a:base, 'copen')
    call s:complete_add(a:base, 'copy')
    call s:complete_add(a:base, 'cpfile')
    call s:complete_add(a:base, 'cprevious')
    call s:complete_add(a:base, 'cquit')
    call s:complete_add(a:base, 'crewind')
    call s:complete_add(a:base, 'cscope')
    call s:complete_add(a:base, 'cstag')
    call s:complete_add(a:base, 'cunabbrev')
    call s:complete_add(a:base, 'cunmap')
    call s:complete_add(a:base, 'cunmenu')
    call s:complete_add(a:base, 'cwindow')
    call s:complete_add(a:base, 'debug')
    call s:complete_add(a:base, 'debuggreedy')
    call s:complete_add(a:base, 'delcommand')
    call s:complete_add(a:base, 'delete')
    call s:complete_add(a:base, 'delfunction')
    call s:complete_add(a:base, 'delmarks')
    call s:complete_add(a:base, 'diffget')
    call s:complete_add(a:base, 'diffoff')
    call s:complete_add(a:base, 'diffpatch')
    call s:complete_add(a:base, 'diffput')
    call s:complete_add(a:base, 'diffsplit')
    call s:complete_add(a:base, 'diffthis')
    call s:complete_add(a:base, 'diffupdate')
    call s:complete_add(a:base, 'digraphs')
    call s:complete_add(a:base, 'display')
    call s:complete_add(a:base, 'djump')
    call s:complete_add(a:base, 'dlist')
    call s:complete_add(a:base, 'doautoall')
    call s:complete_add(a:base, 'doautocmd')
    call s:complete_add(a:base, 'drop')
    call s:complete_add(a:base, 'dsearch')
    call s:complete_add(a:base, 'dsplit')
    call s:complete_add(a:base, 'earlier')
    call s:complete_add(a:base, 'echo')
    call s:complete_add(a:base, 'echoerr')
    call s:complete_add(a:base, 'echohl')
    call s:complete_add(a:base, 'echomsg')
    call s:complete_add(a:base, 'echon')
    call s:complete_add(a:base, 'edit')
    call s:complete_add(a:base, 'else')
    call s:complete_add(a:base, 'elseif')
    call s:complete_add(a:base, 'emenu')
    call s:complete_add(a:base, 'endfor')
    call s:complete_add(a:base, 'endfunction')
    call s:complete_add(a:base, 'endif')
    call s:complete_add(a:base, 'endtry')
    call s:complete_add(a:base, 'endwhile')
    call s:complete_add(a:base, 'enew')
    call s:complete_add(a:base, 'ex')
    call s:complete_add(a:base, 'execute')
    call s:complete_add(a:base, 'exit')
    call s:complete_add(a:base, 'exusage')
    call s:complete_add(a:base, 'file')
    call s:complete_add(a:base, 'files')
    call s:complete_add(a:base, 'filetype')
    call s:complete_add(a:base, 'finally')
    call s:complete_add(a:base, 'find')
    call s:complete_add(a:base, 'finish')
    call s:complete_add(a:base, 'first')
    call s:complete_add(a:base, 'fixdel')
    call s:complete_add(a:base, 'fold')
    call s:complete_add(a:base, 'foldclose')
    call s:complete_add(a:base, 'folddoclosed')
    call s:complete_add(a:base, 'folddoopen')
    call s:complete_add(a:base, 'foldopen')
    call s:complete_add(a:base, 'for')
    call s:complete_add(a:base, 'function')
    call s:complete_add(a:base, 'global')
    call s:complete_add(a:base, 'goto')
    call s:complete_add(a:base, 'grep')
    call s:complete_add(a:base, 'grepadd')
    call s:complete_add(a:base, 'gui')
    call s:complete_add(a:base, 'gvim')
    call s:complete_add(a:base, 'hardcopy')
    call s:complete_add(a:base, 'help')
    call s:complete_add(a:base, 'helpfind')
    call s:complete_add(a:base, 'helpgrep')
    call s:complete_add(a:base, 'helptags')
    call s:complete_add(a:base, 'hide')
    call s:complete_add(a:base, 'highlight')
    call s:complete_add(a:base, 'history')
    call s:complete_add(a:base, 'iabbrev')
    call s:complete_add(a:base, 'iabclear')
    call s:complete_add(a:base, 'if')
    call s:complete_add(a:base, 'ijump')
    call s:complete_add(a:base, 'ilist')
    call s:complete_add(a:base, 'imap')
    call s:complete_add(a:base, 'imapclear')
    call s:complete_add(a:base, 'imenu')
    call s:complete_add(a:base, 'inoreabbrev')
    call s:complete_add(a:base, 'inoremap')
    call s:complete_add(a:base, 'inoremenu')
    call s:complete_add(a:base, 'insert')
    call s:complete_add(a:base, 'intro')
    call s:complete_add(a:base, 'isearch')
    call s:complete_add(a:base, 'isplit')
    call s:complete_add(a:base, 'iunabbrev')
    call s:complete_add(a:base, 'iunmap')
    call s:complete_add(a:base, 'iunmenu')
    call s:complete_add(a:base, 'join')
    call s:complete_add(a:base, 'jumps')
    call s:complete_add(a:base, 'k')
    call s:complete_add(a:base, 'keepalt')
    call s:complete_add(a:base, 'keepjumps')
    call s:complete_add(a:base, 'keepmarks')
    call s:complete_add(a:base, 'lNext')
    call s:complete_add(a:base, 'lNfile')
    call s:complete_add(a:base, 'laddbuffer')
    call s:complete_add(a:base, 'laddexpr')
    call s:complete_add(a:base, 'laddfile')
    call s:complete_add(a:base, 'language')
    call s:complete_add(a:base, 'last')
    call s:complete_add(a:base, 'later')
    call s:complete_add(a:base, 'lbuffer')
    call s:complete_add(a:base, 'lcd')
    call s:complete_add(a:base, 'lchdir')
    call s:complete_add(a:base, 'lclose')
    call s:complete_add(a:base, 'lcscope')
    call s:complete_add(a:base, 'left')
    call s:complete_add(a:base, 'leftabove')
    call s:complete_add(a:base, 'let')
    call s:complete_add(a:base, 'lexpr')
    call s:complete_add(a:base, 'lfile')
    call s:complete_add(a:base, 'lfirst')
    call s:complete_add(a:base, 'lgetbuffer')
    call s:complete_add(a:base, 'lgetexpr')
    call s:complete_add(a:base, 'lgetfile')
    call s:complete_add(a:base, 'lgrep')
    call s:complete_add(a:base, 'lgrepadd')
    call s:complete_add(a:base, 'lhelpgrep')
    call s:complete_add(a:base, 'list')
    call s:complete_add(a:base, 'll')
    call s:complete_add(a:base, 'llast')
    call s:complete_add(a:base, 'llist')
    call s:complete_add(a:base, 'lmake')
    call s:complete_add(a:base, 'lmap')
    call s:complete_add(a:base, 'lmapclear')
    call s:complete_add(a:base, 'lnewer')
    call s:complete_add(a:base, 'lnext')
    call s:complete_add(a:base, 'lnfile')
    call s:complete_add(a:base, 'lnoremap')
    call s:complete_add(a:base, 'loadkeymap')
    call s:complete_add(a:base, 'loadview')
    call s:complete_add(a:base, 'lockmarks')
    call s:complete_add(a:base, 'lockvar')
    call s:complete_add(a:base, 'lolder')
    call s:complete_add(a:base, 'lopen')
    call s:complete_add(a:base, 'lpfile')
    call s:complete_add(a:base, 'lprevious')
    call s:complete_add(a:base, 'lrewind')
    call s:complete_add(a:base, 'ls')
    call s:complete_add(a:base, 'ltag')
    call s:complete_add(a:base, 'lunmap')
    call s:complete_add(a:base, 'lvimgrep')
    call s:complete_add(a:base, 'lvimgrepadd')
    call s:complete_add(a:base, 'lwindow')
    call s:complete_add(a:base, 'make')
    call s:complete_add(a:base, 'map')
    call s:complete_add(a:base, 'mapclear')
    call s:complete_add(a:base, 'mark')
    call s:complete_add(a:base, 'marks')
    call s:complete_add(a:base, 'match')
    call s:complete_add(a:base, 'menu')
    call s:complete_add(a:base, 'menutranslate')
    call s:complete_add(a:base, 'messages')
    call s:complete_add(a:base, 'mkexrc')
    call s:complete_add(a:base, 'mksession')
    call s:complete_add(a:base, 'mkspell')
    call s:complete_add(a:base, 'mkview')
    call s:complete_add(a:base, 'mkvimrc')
    call s:complete_add(a:base, 'mode')
    call s:complete_add(a:base, 'move')
    call s:complete_add(a:base, 'mzfile')
    call s:complete_add(a:base, 'mzscheme')
    call s:complete_add(a:base, 'nbkey')
    call s:complete_add(a:base, 'new')
    call s:complete_add(a:base, 'next')
    call s:complete_add(a:base, 'nmap')
    call s:complete_add(a:base, 'nmapclear')
    call s:complete_add(a:base, 'nmenu')
    call s:complete_add(a:base, 'nnoremap')
    call s:complete_add(a:base, 'nnoremenu')
    call s:complete_add(a:base, 'noautocmd')
    call s:complete_add(a:base, 'nohlsearch')
    call s:complete_add(a:base, 'noreabbrev')
    call s:complete_add(a:base, 'noremap')
    call s:complete_add(a:base, 'noremenu')
    call s:complete_add(a:base, 'normal')
    call s:complete_add(a:base, 'number')
    call s:complete_add(a:base, 'nunmap')
    call s:complete_add(a:base, 'nunmenu')
    call s:complete_add(a:base, 'omap')
    call s:complete_add(a:base, 'omapclear')
    call s:complete_add(a:base, 'omenu')
    call s:complete_add(a:base, 'only')
    call s:complete_add(a:base, 'onoremap')
    call s:complete_add(a:base, 'onoremenu')
    call s:complete_add(a:base, 'open')
    call s:complete_add(a:base, 'options')
    call s:complete_add(a:base, 'ounmap')
    call s:complete_add(a:base, 'ounmenu')
    call s:complete_add(a:base, 'pclose')
    call s:complete_add(a:base, 'pedit')
    call s:complete_add(a:base, 'perl')
    call s:complete_add(a:base, 'perldo')
    call s:complete_add(a:base, 'pop')
    call s:complete_add(a:base, 'popup')
    call s:complete_add(a:base, 'ppop')
    call s:complete_add(a:base, 'preserve')
    call s:complete_add(a:base, 'previous')
    call s:complete_add(a:base, 'print')
    call s:complete_add(a:base, 'profdel')
    call s:complete_add(a:base, 'profile')
    call s:complete_add(a:base, 'promptfind')
    call s:complete_add(a:base, 'promptrepl')
    call s:complete_add(a:base, 'psearch')
    call s:complete_add(a:base, 'ptNext')
    call s:complete_add(a:base, 'ptag')
    call s:complete_add(a:base, 'ptfirst')
    call s:complete_add(a:base, 'ptjump')
    call s:complete_add(a:base, 'ptlast')
    call s:complete_add(a:base, 'ptnext')
    call s:complete_add(a:base, 'ptprevious')
    call s:complete_add(a:base, 'ptrewind')
    call s:complete_add(a:base, 'ptselect')
    call s:complete_add(a:base, 'put')
    call s:complete_add(a:base, 'pwd')
    call s:complete_add(a:base, 'pyfile')
    call s:complete_add(a:base, 'python')
    call s:complete_add(a:base, 'qall')
    call s:complete_add(a:base, 'quit')
    call s:complete_add(a:base, 'quitall')
    call s:complete_add(a:base, 'read')
    call s:complete_add(a:base, 'recover')
    call s:complete_add(a:base, 'redir')
    call s:complete_add(a:base, 'redo')
    call s:complete_add(a:base, 'redraw')
    call s:complete_add(a:base, 'redrawstatus')
    call s:complete_add(a:base, 'registers')
    call s:complete_add(a:base, 'resize')
    call s:complete_add(a:base, 'retab')
    call s:complete_add(a:base, 'return')
    call s:complete_add(a:base, 'rewind')
    call s:complete_add(a:base, 'right')
    call s:complete_add(a:base, 'rightbelow')
    call s:complete_add(a:base, 'ruby')
    call s:complete_add(a:base, 'rubydo')
    call s:complete_add(a:base, 'rubyfile')
    call s:complete_add(a:base, 'runtime')
    call s:complete_add(a:base, 'rviminfo')
    call s:complete_add(a:base, 'sNext')
    call s:complete_add(a:base, 'sall')
    call s:complete_add(a:base, 'sandbox')
    call s:complete_add(a:base, 'sargument')
    call s:complete_add(a:base, 'saveas')
    call s:complete_add(a:base, 'sbNext')
    call s:complete_add(a:base, 'sball')
    call s:complete_add(a:base, 'sbfirst')
    call s:complete_add(a:base, 'sblast')
    call s:complete_add(a:base, 'sbmodified')
    call s:complete_add(a:base, 'sbnext')
    call s:complete_add(a:base, 'sbprevious')
    call s:complete_add(a:base, 'sbrewind')
    call s:complete_add(a:base, 'sbuffer')
    call s:complete_add(a:base, 'scriptencoding')
    call s:complete_add(a:base, 'scriptnames')
    call s:complete_add(a:base, 'scscope')
    call s:complete_add(a:base, 'set')
    call s:complete_add(a:base, 'setfiletype')
    call s:complete_add(a:base, 'setglobal')
    call s:complete_add(a:base, 'setlocal')
    call s:complete_add(a:base, 'sfind')
    call s:complete_add(a:base, 'sfirst')
    call s:complete_add(a:base, 'shell')
    call s:complete_add(a:base, 'sign')
    call s:complete_add(a:base, 'silent')
    call s:complete_add(a:base, 'simalt')
    call s:complete_add(a:base, 'slast')
    call s:complete_add(a:base, 'sleep')
    call s:complete_add(a:base, 'smagic')
    call s:complete_add(a:base, 'smap')
    call s:complete_add(a:base, 'smapclear')
    call s:complete_add(a:base, 'smenu')
    call s:complete_add(a:base, 'snext')
    call s:complete_add(a:base, 'sniff')
    call s:complete_add(a:base, 'snomagic')
    call s:complete_add(a:base, 'snoremap')
    call s:complete_add(a:base, 'snoremenu')
    call s:complete_add(a:base, 'sort')
    call s:complete_add(a:base, 'source')
    call s:complete_add(a:base, 'spelldump')
    call s:complete_add(a:base, 'spellgood')
    call s:complete_add(a:base, 'spellinfo')
    call s:complete_add(a:base, 'spellrepall')
    call s:complete_add(a:base, 'spellundo')
    call s:complete_add(a:base, 'spellwrong')
    call s:complete_add(a:base, 'split')
    call s:complete_add(a:base, 'sprevious')
    call s:complete_add(a:base, 'srewind')
    call s:complete_add(a:base, 'stag')
    call s:complete_add(a:base, 'star')
    call s:complete_add(a:base, 'startgreplace')
    call s:complete_add(a:base, 'startinsert')
    call s:complete_add(a:base, 'startreplace')
    call s:complete_add(a:base, 'stjump')
    call s:complete_add(a:base, 'stop')
    call s:complete_add(a:base, 'stopinsert')
    call s:complete_add(a:base, 'stselect')
    call s:complete_add(a:base, 'substitute')
    call s:complete_add(a:base, 'sunhide')
    call s:complete_add(a:base, 'sunmap')
    call s:complete_add(a:base, 'sunmenu')
    call s:complete_add(a:base, 'suspend')
    call s:complete_add(a:base, 'sview')
    call s:complete_add(a:base, 'swapname')
    call s:complete_add(a:base, 'syncbind')
    call s:complete_add(a:base, 'syntax')
    call s:complete_add(a:base, 't')
    call s:complete_add(a:base, 'tNext')
    call s:complete_add(a:base, 'tab')
    call s:complete_add(a:base, 'tabNext')
    call s:complete_add(a:base, 'tabclose')
    call s:complete_add(a:base, 'tabdo')
    call s:complete_add(a:base, 'tabedit')
    call s:complete_add(a:base, 'tabfind')
    call s:complete_add(a:base, 'tabfirst')
    call s:complete_add(a:base, 'tablast')
    call s:complete_add(a:base, 'tabmove')
    call s:complete_add(a:base, 'tabnew')
    call s:complete_add(a:base, 'tabnext')
    call s:complete_add(a:base, 'tabonly')
    call s:complete_add(a:base, 'tabprevious')
    call s:complete_add(a:base, 'tabrewind')
    call s:complete_add(a:base, 'tabs')
    call s:complete_add(a:base, 'tag')
    call s:complete_add(a:base, 'tags')
    call s:complete_add(a:base, 'tcl')
    call s:complete_add(a:base, 'tcldo')
    call s:complete_add(a:base, 'tclfile')
    call s:complete_add(a:base, 'tearoff')
    call s:complete_add(a:base, 'tfirst')
    call s:complete_add(a:base, 'throw')
    call s:complete_add(a:base, 'tjump')
    call s:complete_add(a:base, 'tlast')
    call s:complete_add(a:base, 'tmenu')
    call s:complete_add(a:base, 'tnext')
    call s:complete_add(a:base, 'topleft')
    call s:complete_add(a:base, 'tprevious')
    call s:complete_add(a:base, 'trewind')
    call s:complete_add(a:base, 'try')
    call s:complete_add(a:base, 'tselect')
    call s:complete_add(a:base, 'tunmenu')
    call s:complete_add(a:base, 'unabbreviate')
    call s:complete_add(a:base, 'undo')
    call s:complete_add(a:base, 'undojoin')
    call s:complete_add(a:base, 'undolist')
    call s:complete_add(a:base, 'unhide')
    call s:complete_add(a:base, 'unlet')
    call s:complete_add(a:base, 'unlockvar')
    call s:complete_add(a:base, 'unmap')
    call s:complete_add(a:base, 'unmenu')
    call s:complete_add(a:base, 'update')
    call s:complete_add(a:base, 'verbose')
    call s:complete_add(a:base, 'version')
    call s:complete_add(a:base, 'vertical')
    call s:complete_add(a:base, 'vglobal')
    call s:complete_add(a:base, 'view')
    call s:complete_add(a:base, 'vimgrep')
    call s:complete_add(a:base, 'vimgrepadd')
    call s:complete_add(a:base, 'visual')
    call s:complete_add(a:base, 'viusage')
    call s:complete_add(a:base, 'vmap')
    call s:complete_add(a:base, 'vmapclear')
    call s:complete_add(a:base, 'vmenu')
    call s:complete_add(a:base, 'vnew')
    call s:complete_add(a:base, 'vnoremap')
    call s:complete_add(a:base, 'vnoremenu')
    call s:complete_add(a:base, 'vsplit')
    call s:complete_add(a:base, 'vunmap')
    call s:complete_add(a:base, 'vunmenu')
    call s:complete_add(a:base, 'wNext')
    call s:complete_add(a:base, 'wall')
    call s:complete_add(a:base, 'while')
    call s:complete_add(a:base, 'wincmd')
    call s:complete_add(a:base, 'windo')
    call s:complete_add(a:base, 'winpos')
    call s:complete_add(a:base, 'winsize')
    call s:complete_add(a:base, 'wnext')
    call s:complete_add(a:base, 'wprevious')
    call s:complete_add(a:base, 'wq')
    call s:complete_add(a:base, 'wqall')
    call s:complete_add(a:base, 'write')
    call s:complete_add(a:base, 'wsverb')
    call s:complete_add(a:base, 'wviminfo')
    call s:complete_add(a:base, 'xall')
    call s:complete_add(a:base, 'xit')
    call s:complete_add(a:base, 'xmap')
    call s:complete_add(a:base, 'xmapclear')
    call s:complete_add(a:base, 'xmenu')
    call s:complete_add(a:base, 'xnoremap')
    call s:complete_add(a:base, 'xnoremenu')
    call s:complete_add(a:base, 'xunmap')
    call s:complete_add(a:base, 'xunmenu')
    call s:complete_add(a:base, 'yank')
    call s:complete_add(a:base, 'z')
    call s:complete_add(a:base, '~')
endfunction "}}}

function! s:do_complete_eval(base) "{{{
    " TODO
endfunction "}}}


function! s:complete_add(base, expr) "{{{
    if s:stridx(a:expr, a:base) == 0
        call complete_add(a:expr)
    endif
    if complete_check()
        throw 'key typed'
    endif
endfunction "}}}

function! s:stridx(haystack, needle, ...) "{{{
    " TODO Global variable for &ignorecase.
    return call('stridx', [tolower(a:haystack), tolower(a:needle)] + a:000)
endfunction "}}}

" }}}

" Restore 'cpoptions' {{{
let &cpo = s:save_cpo
" }}}
