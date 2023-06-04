**Vimtutor**

# Vim BASIC COMMANDS
www.openvim.com

|:--|:--|
|`i`, `I` |change to insert mode |
|`h`, `j`, `k`, `l` |move L D U R |
|`w`, `b`, `e`, `ge` | move word at a time |
|`[n][action/movement]` | do n times, e.g. 3w |
|`x`, `X` | remove a character |
|`a`, `A` | append |
|`f[char]` | move to next char in line |


- I -> insert mode
- Shift+V -> visual mode 
- Select multiple lines: Ctrl+V + up/down arrows
- Tab multiple lines: select them and and type : + > or < + Enter
- Go to the end ($) or beggining (0) of a line
- Quit Vim
  - write and quit -> :wq
  - force -> :q!

- Whole line copy/yank (yy), paste (p), delete (dd)
- Delete character (x)

- Find and replace: `:in,end s/old/news`


## [Intro to Vim (Commands)](https://docs.google.com/document/u/0/d/1San2OZ3jodDSFeJXPFfWtUUA19ub42RNqgnfBkSQKGw/mobilebasic)

### Insert

|:--:|:--|
| `i` |Start typing before your cursor. |
| `a` |Start typing after your cursor. |
| `I` |Start typing at the beginning of the line. |
| `A` |Start typing at the end of the line. |
| `o` |Start typing in a new line after your cursor. |
| `O` |Start typing in a new line before your cursor. |
|\*To get out of insert mode, press the **ESC** button. ||


### Navigate

|:--:|:--|
| `gg` |Takes your cursor to the beginning of the file. |
| `G` |Takes your cursor to the end of the file. |
| `$` |Takes your cursor to the end of the line. |
| `0` |Takes your cursor to the beginning of the line. |
| `{` |Takes your cursor to the next space of a paragraph in an upward direction. |
| `}` |Takes your cursor to the next space of a paragraph in a down direction. |
| `w` |Takes your cursor to the next word to the right. |
| `W` |Takes your cursor to the next word separated by a space to the right. |
| `b` |Takes your cursor to the next word to the left. |
| `B` |Takes your cursor to the next word separated by a space to the left. |


### Search

|:--:|:--|
| `fj` |Lets you find the closest j to the right of the line that you’re on. |
| `FM` |Lets you find the closest M to the left of the line that you’re on. |
| `/hi` |Lets you find the word hi throughout the file. |
| `n` |Lets you navigate rightwards through each hi that was found. |
| `N` |Lets you navigate leftwards through each hi that was found. |
| `#` |Lets you find the word that your cursor is on throughout the file and navigate leftwards through each found word. |
| `*` |Lets you find the word that your cursor is on throughout the file and navigate rightwards through each found word. |


### Edit

|:--:|:--|
| `d` |Deletes something. That something is usually one of our navigation demands. |
| `df)` |Deletes everything up until ), including ). |
| `dt(` |Deletes everything up until ), excluding ). |
| `dd` |Deletes the entire line that your cursor is on. |
| `5dw` |Deletes 5 words. Mind you, it also treats symbols such as ! and ( and , and etc. as words. |
| `p` |Pastes to the right of the cursor. If you copied an entire line then it would get pasted on the next line of the cursor. |
| `P` |Pastes to the left of the cursor. If you copied an entire line then it would get pasted on the line before the cursor. |
| `di` |Deletes within specific characters. |
| `dit` |Deletes whatever is within the tag that your cursor is currently on. |
| `di(` |Deletes whatever is within the parenthesis that your cursor is currently on. |
| `dat` |Deletes the entire tag; everything that is in the tag and also the opening and closing tags themselves. |
| `ci` |Is like di but on steroids. It deletes within specific characters and automatically goes into insert mode. |
| `ci'` |Deletes whatever is inside the closest ‘ and automatically puts you into insert mode. |
| `cit` |Deletes whatever is inside the closest tag and automatically puts you into insert mode. |



---

# SOURCES

https://www.freecodecamp.org/news/vimrc-configuration-guide-customize-your-vim-editor/

https://github.com/brandon-wallace/vimrc/blob/main/.vimrc

https://gist.github.com/benawad/b768f5a5bbd92c8baabd363b7e79786f

https://github.com/nschurmann/configs/blob/master/.vimrc

https://github.com/NeuralNine/config-files/blob/master/init.vim
