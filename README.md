A lightweight VIM and gVIM configuration for true color terminal.


## Installation ##

### Linux ###
Just clone to `$HOME/.vim`.

### Windows ###
Just clone to `%userprofile%\vimfiles`.

### WSL ###
Clone to one place and create symbolic links.
Note that on Windows 10, a symbolic link can be created using the
[mklink](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/mklink)
command.


## Hotkeys ##

Hotkeys | Modes | Effect
:---:|:---:|:---
F2 | ni | Enable or disable highlighting of cursor line.
F3 | nvi | Enable or disable line numbers.
F4 | n | Quit if there are no unsaved changes.
F5 | ni | Remove trailing spaces.
F6 | ni | Remove Windows style line endings, as dos2unix.
F8 | n | Reopen buffer in hex or turn back into a text.
Leader-w | n | Save changes to file.
Leader-c-d | nv | Change current working directory to the opened file's directory.
Leader-p-p | n | Enable or disable paste mode (prevents auto-indentation on copy-paste).
Leader-s-s | n | Enable or disable spell checking.
Leader-s-n | n | Go to next spell check highlighting.
Leader-s-p | n | Go to previous spell check highlighting.
Leader-s-a | n | Mark current misspelled word as good.
Leader-s-? | n | Show suggestions for correcting a misspelled word.
\* | nv | Search forward the selection or the word under cursor.
\# | nv | Search backward the selection or the word under cursor.
Space | nv | Start typing search forward command.
Ctrl-Space | nv | Start typing search backward command.
Leader-Enter | nv | Clear the highlighting of search results.
Leader-h | nv | Set cursor to the first non-blank symbol in the line.
Leader-l | nv | Set cursor to the last non-blank symbol in the line.
Leader-k, Alt-Up | nvi | Move the cursor line or selection one line up.
Leader-j, Alt-Down | nvi | Move the cursor line or selection one line down.
Leader-t-n | nv | Open new empty tab.
Leader-t-e | nv | Open new tab with current file's path.
Leader-t-l | nv | Move current tab left in the tab list.
Leader-t-r | nv | Move current tab right in the tab list.
