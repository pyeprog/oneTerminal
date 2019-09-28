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

No customizable key binding provided for this version of one terminal

Use <leader>t for terminal toggling

## Install
add the following statements into your .vimrc

### Plug
`Plug pyeprog/oneTerminal`

### Vundle
`Bundle pyeprog/oneTerminal`
