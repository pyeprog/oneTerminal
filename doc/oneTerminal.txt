# oneTerminal
A terminal plugin for vim8.1, version lower than 8.1 has no terminal mode.
This plugin holds a terminal buffer in your buffer list and provides an easy way to switch your focus from working buffer to a terminal

## Install vim8.1
You can only fetch vim of 7 or 8.0 via tools like `apt` or `dnf`.
Thus to taste new feature of vim8.1, you need to build your vim from source code.

**5 Steps:**
1. Clone vim's source code from [its github repo](https://github.com/vim/vim)
2. `cd vim`
3. `./configure`
4. `make`
5. `sudo make install`

## Change key-binding for terminal toggle
For example
`let g:terminal_key = '<F5>'` binds F5 to toggle your terminal

## Configure the default terminal window position 
`let g:terminal_window_position = 'right'`

`right`, `left`, `top` and `bottom` are valid settings.

