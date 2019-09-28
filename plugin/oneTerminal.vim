" One terminal

if v:version < 801
    finish
endif

let g:terminal_status = 0

tnoremap <esc> <c-w>N

function! TerminalToggle()
    if g:terminal_status == 0
        let g:terminal_status = 1
        if len(term_list()) == 0
            execute "term"
        else
            execute "sb! " . g:terminal_buf
        endif
    else
        if len(term_list()) > 0
            if g:terminal_buf != bufnr('%')
                let l:term_win_id = win_findbuf(term_list()[0])[0]
                if !win_gotoid(l:term_win_id)
                    return
                endif
            endif
            execute "hide"
        endif
        let g:terminal_status = 0
    endif
    let g:terminal_buf = term_list()[0]
endfunction


function! TerminalShutdown()
    if len(term_list()) > 0
        silent! execute "bd! " . g:terminal_buf
    endif
endfunction

autocmd! ExitPre * :call TerminalShutdown()<cr>
tnoremap <leader>t <c-w>:call TerminalToggle()<cr>
nnoremap <leader>t :call TerminalToggle()<cr>

