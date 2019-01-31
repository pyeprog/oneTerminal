let s:terminal_window_position = get(g:, "terminal_window_position", 'right')
let s:terminal_window_id = -1
let s:terminal_buffer_id = -1
let s:terminal_key = get(g:, "terminal_key", '<F7>')

" version lower than 8.01 has no terminal mode
if v:version < 801
    finish
endif

function MoveWindow()
    if s:terminal_window_position ==? 'left'
        wincmd H
    elseif s:terminal_window_position ==? 'top'
        wincmd K
    elseif s:terminal_window_position ==? 'bottom'
        wincmd J
    else 
        wincmd L
    endif
endfunction


function TerminalOpen()
    if !bufexists(s:terminal_buffer_id)
        verti term ++kill="kill" ++norestore
        call MoveWindow()
        let s:terminal_window_id = win_getid()
        let s:terminal_buffer_id = bufnr('%')
        silent file oneterminal
    else
        if !win_gotoid(s:terminal_window_id)
            sp
            call MoveWindow()
            buffer! oneterminal
            let s:terminal_window_id = win_getid()
        else
            call MoveWindow()
        endif
    endif
endfunction


function TerminalHide()
    if win_gotoid(s:terminal_window_id)
        hide
    endif
endfunction


function TerminalClose()
    if bufexists(s:terminal_buffer_id)
        silent bd! oneterminal
        let s:terminal_buffer_id = -1
    endif
endfunction


function TerminalToggle()
    if win_gotoid(s:terminal_window_id)
        silent call TerminalHide()
    else
        silent call TerminalOpen()
    endif
endfunction


augroup terminalOperate
    au!
    au ExitPre * call TerminalClose()
    au QuitPre * call TerminalClose()
augroup END


execute 'nnoremap '.s:terminal_key.':call TerminalToggle()<CR>'
execute 'tnoremap '.s:terminal_key.'<C-w>N:call TerminalToggle()<CR>'
tnoremap <C-[> <C-w>N

