" One terminal

if v:version < 800
    finish
endif

let g:terminal_status = 0

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
                let l:term_win_ids = win_findbuf(term_list()[0])
                if len(l:term_win_ids) > 0
                    if !win_gotoid(l:term_win_ids[0])
                        return
                    endif
                else
                    " if terminal is closed by hand
                    let g:terminal_status = 0
                    call TerminalToggle()
                    return
                endif
            endif
            execute "hide"
        endif
        let g:terminal_status = 0
    endif
    if len(term_list()) > 0
        let g:terminal_buf = term_list()[0]
    endif
endfunction

function! TerminalShutdown()
    if len(term_list()) > 0
        let l:shutdown_cmd = 'bd! '
        if len(getbufinfo({'buflisted':1})) == 1
            let l:shutdown_cmd = 'q! '
        endif
        silent! execute l:shutdown_cmd . g:terminal_buf
    endif
endfunction

augroup AutoCloseTerm
    autocmd!
    autocmd QuitPre :call TerminalShutdown()<cr>
augroup END

tnoremap <leader>t <c-w>:call TerminalToggle()<cr>
nnoremap <leader>t :call TerminalToggle()<cr>
