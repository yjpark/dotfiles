To use Vim with YouCompleteMe, using a pre-built version for now

- https://bitbucket.org/Haroogan/vim-youcompleteme-for-windows/src

For the OmniSharp for cs files, need to open the project with Visual Studio, and compile
```
ycm_folder/python/ycm/completers/cs/OmniSharpServer/OmniSharp.sln
```
Better use chocolatey python, the one in scoop can't be found by this vim automatically
```
choco install python2
```

Create an empty folder as `~/.janus/YouCompleteMe`

Install ctags with chocolatey
```
choco install ctags
```

Fullscreen support
- https://github.com/xqin/gvimfullscreen

To install the vimproc
```
choco install mingw
cd ~/.vim/bundle/vimproc.vim/
tools\\update-dll-mingw.bat
```
