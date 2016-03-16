let s:cache_dir = get(g:dotvim_settings, 'cache_dir', '~/.vim/.cache')
function! s:get_cache_dir(suffix) "{{{
    return resolve(expand(s:cache_dir . '/' . a:suffix))
endfunction "}}}


NeoBundleLazy 'scrooloose/nerdtree', {'autoload':{'commands':['NERDTreeToggle','NERDTreeFind']}} "{{{
    let NERDTreeShowHidden=1
    let NERDTreeQuitOnOpen=0
    let NERDTreeShowLineNumbers=0
    let NERDTreeChDirMode=0
    let NERDTreeShowBookmarks=1
    let NERDTreeIgnore=['\.git','\.hg', '\.meta$', '\.pyc$', '\.silp_backup']
    let NERDTreeBookmarksSort=0
    let NERDTreeBookmarksFile=s:get_cache_dir('nerdtree-bookmarks')
    if !empty($NERDTREE_BOOKMARKS)
        if filereadable($NERDTREE_BOOKMARKS)
            let g:NERDTreeBookmarksFile = $NERDTREE_BOOKMARKS
        endif
    endif
    """nnoremap <F2> :NERDTreeToggle<CR>
    """nnoremap <F3> :NERDTreeFind<CR>
"}}}

" sync the nerdtree to current buffer if it's opened
" http://superuser.com/questions/195022/vim-how-to-synchronize-nerdtree-with-current-opened-tab-file-path
" returns true iff is NERDTree open/active
function! YJParkIsNTOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" returns true iff focused window is NERDTree window
function! YJParkIsNTFocused()
  return -1 != match(expand('%'), 'NERD_Tree')
endfunction

" calls NERDTreeFind if NERDTree is active, current window contains a modifiable file, and we're not in vimdiff
function! YJParkSyncTree()
  if &modifiable && YJParkIsNTOpen() && !YJParkIsNTFocused() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

autocmd BufEnter * call YJParkSyncTree()


