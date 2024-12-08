# Learning notes

<!--toc:start-->
- [Learning notes](#learning-notes)
  - [Useful command that I learnt](#useful-command-that-i-learnt)
  - [What to learn](#what-to-learn)
    - [DB](#db)
    - [Tmux window switch](#tmux-window-switch)
    - [I3](#i3)
    - [Open telescope select in a split](#open-telescope-select-in-a-split)
    - [Hurl](#hurl)
    - [How to navigate with Harpoon](#how-to-navigate-with-harpoon)
    - [Git Worktree](#git-worktree)
    - [Obsidian Integration](#obsidian-integration)
    - [Obsidian](#obsidian)
<!--toc:end-->

## Useful command that I learnt

ciw : replace word under the cursor
leader + , : change file in the buffer
leader + | : right split
leader + - : down split
ctrl + h/j/k/l : to moved between split view
ctrl + arrows : to resize split view
leader + cm : open mason manager LSP
leader + sC : fzf search for available command
:q : to close a split tab
ctrl-r + {register} : to paste in vim
s + {search-term} : use leap.nvim to jump to any location
:LazyExtras : to install more nvim plugins such as LSP
K : to view docs of a function
leader + xx : view diagnostics panel
leader + ca : to trigger code action
leader + uC : change color scheme
\[ / \] + b : to go left/right opened tab
Shift + h/l has the same effect and i like it better

leader + fb : fzf file in buffer
leader + sh : open command help
leader + sk : search key maps
leader + sr : search and replace
leader + fT : open a quick terminal
gc : to comment multiple line
gc + o/O : add comment below above

<!--this is a comment-->

leader gB : git browse to remote repo
gc : comment multiple line
leader + p : open yank history
leader + ghb : git blame line
v : to quit and enter visual mode
leader + wm : to maximize (temporally full screen a window)
:TSInstallInfo : to list all supported language by TreeSitter
In a markdown file, you can use leader + ca to generate table of content

## What to learn

### DB

- toggle DBUI : leader + D

### Tmux window switch

- Ctrl + h/j/k/l : to switch between tmux window

### I3

### Open telescope select in a split

- C-x : horizontal split
- C-v : vertical split

### Hurl

- go to ~/.local/share/nvim/lazy/hurl.nvim
- install code coloring for .hurl file with `:TSInstall hurl`
- if .hurl fails it will be logged to a split window

### How to navigate with Harpoon

+ **Buffer:** A file or text loaded in memory.
+ **Window:** A viewport displaying a buffer. Each window has its own jump list.
+ **Tab:** A collection of windows 
+ **Jump List:** Tracks cursor movements to significant locations in a window.
+ **Harpoon:** Bookmark manager for buffers/files. Quickly switch to frequently used files in the current window.

### Git Worktree

### Obsidian Integration

### Obsidian

- Excalidraw
- Dataview
- Zetllrkasen
- Git
