call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jesseleite/vim-agriculture'

Plug 'gosukiwi/vim-atom-dark'
Plug 'scrooloose/nerdtree'

Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic'

Plug 'ervandew/supertab'
Plug 'tpope/vim-endwise'
Plug 'godlygeek/tabular'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/YankRing.vim'
Plug 'sjl/gundo.vim'
Plug 'kana/vim-textobj-user'
Plug 'mattn/gist-vim'
Plug 'tpope/vim-cucumber'
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-unimpaired'
Plug 'romainl/vim-qf'

"Git

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

Plug 'vim-ruby/vim-ruby'
Plug 'rhysd/vim-textobj-ruby'
"Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'tpope/vim-rails'

Plug 'dsawardekar/portkey'
Plug 'dsawardekar/ember.vim'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'andrewradev/ember_tools.vim'

Plug 'Shougo/neocomplete.vim'
Plug 'christoomey/vim-tmux-navigator'
"Plug 'terryma/vim-multiple-cursors'
Plug 'chrisbra/NrrwRgn'
Plug 'jpalardy/vim-slime'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'junegunn/vim-peekaboo'
Plug 'justinmk/vim-gtfo'

"Plug 'rlue/vim-fold-rspec'


"Plug 'rking/ag.vim'
"Plug 'kien/ctrlp.vim'


call plug#end()


" Section: configuration

  scriptencoding utf-8

  " Colorscheme
  "colorscheme gruvbox
  "set background=dark
  "let g:gruvbox_bold=1
  "let g:gruvbox_italic=1
  "let g:gruvbox_underline=1
  "let g:gruvbox_undercurl=1
  
  syntax enable
  set background=dark
  colorscheme solarized

  "colorscheme atom-dark-256
  "colorscheme jellybeans
  "colorscheme ir_black
  "
  " These two enable syntax highlighting
  set nocompatible " We're running Vim, not Vi!
  syntax on " Enable syntax highlighting

  " Enable filetype-specific indenting and plugins
  filetype plugin indent on

  " show the `best match so far' as search strings are typed
  set incsearch

  " set no wrap
  set nowrap

  " Highlight search results once found:
  set hlsearch
  " Show line numbers
  set number

  "sm: flashes matching brackets or parentheses
  set showmatch

  "sta:   helps with backspacing because of expandtab
  set smarttab

  " Change <Leader>
  let mapleader = ","

  " Change <Space>
  noremap <space> :

  " Set temporary directory (don't litter local dir with swp/tmp files)
  set directory=/tmp/

  " When scrolling off-screen do so 3 lines at a time, not 1
  set scrolloff=3

  " Enable tab complete for commands
  " first tab shows all matches. next tab starts cycling through the matches
  set wildmenu
  set wildmode=list:longest,full

  " enable setting title
  set title
  " configure title to look like: Vim /path/to/file
  set titlestring=VIM:\ %-25.55F\ %a%r%m titlelen=70

  " 'murica
  set spelllang=en_us

  :set t_Co=16

  " Turn off rails bits of statusbar
  let g:rails_statusline=0

  " quit NERDTree after openning a file
  let NERDTreeQuitOnOpen=1
  " colored NERD Tree
  let NERDChristmasTree = 1
  let NERDTreeHighlightCursorline = 1
  let NERDTreeShowHidden = 1
  " map enter to activating a node
  let NERDTreeMapActivateNode='o'
  let NERDTreeIgnore=['\.git','\.DS_Store','\.pdf', '.beam']

  nnoremap <C-g> :NERDTreeToggle<cr>
  nnoremap <C-f> :NERDTreeFind<cr>

  " limit number of results shown for performance
  let g:fuzzy_matching_limit=60
  " ignore stuff that can't be openned, and generated files
  let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;*.beam;vendor/**;coverage/**;tmp/**;rdoc/**"
  " increate the number of files scanned for very large projects
  let g:fuzzy_ceiling=20000
  " display relative path, instead of abbrevated path (lib/jeweler.rb vs
  " l/jeweler.rb)
  let g:fuzzy_path_display = 'relative_path'

  let g:browser = 'open '

  " use the_silver_surfer for Ack
  let g:ackprg = 'ag --nogroup --nocolor --column'

  " Folding
  let g:fold_rspec_foldenable = 0

  let g:slime_paste_file = "$HOME/.slime_paste"
  let g:slime_target = "tmux"

  augroup myfiletypes
    " Clear old autocmds in group
    autocmd!
    " autoindent with two spaces, always expand tabs
    autocmd FileType ruby,eruby,yaml set autoindent shiftwidth=2 softtabstop=2 tabstop=2 expandtab
    autocmd FileType python set autoindent shiftwidth=4 softtabstop=4 expandtab
    autocmd FileType javascript,html,hbs,htmldjango,css set autoindent shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType vim set autoindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType cucumber set autoindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType puppet set autoindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
    au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
    au BufRead,BufNewFile *etc/nginx/* set ft=nginx
    " treat rackup files like ruby
    au BufRead,BufNewFile *.ru set ft=ruby
    au BufRead,BufNewFile Gemfile set ft=ruby
    autocmd BufEnter *.haml setlocal cursorcolumn
    au BufRead,BufNewFile Gemfile set ft=ruby
    au BufRead,BufNewFile Capfile set ft=ruby
    au BufRead,BufNewFile Thorfile set ft=ruby
    au BufRead,BufNewFile *.god set ft=ruby
    au BufRead,BufNewFile .caprc set ft=ruby
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
  augroup END


  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endi

  " Turn on language specific omnifuncs
  autocmd FileType ruby set omnifunc=rubycomplete#Complete
  autocmd FileType python set omnifunc=pythoncomplete#Complete
  autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
  autocmd FileType css set omnifunc=csscomplete#CompleteCSS
  autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
  autocmd FileType php set omnifunc=phpcomplete#CompletePHP
  autocmd FileType c set omnifunc=ccomplete#Complete

  " have some fun with bufexplorer
  let g:bufExplorerDefaultHelp=0       " Do not show default help.
  let g:bufExplorerShowRelativePath=1  " Show relative paths.

  " IRB {{{
  autocmd FileType irb inoremap <buffer> <silent> <CR> <Esc>:<C-u>ruby v=VIM::Buffer.current;v.append(v.line_number, eval(v[v.line_number]).inspect)<CR>

" Section: functions

  function! s:RunShellCommand(cmdline)
    botright new

    setlocal buftype=nofile
    setlocal bufhidden=delete
    setlocal nobuflisted
    setlocal noswapfile
    setlocal nowrap
    setlocal filetype=shell
    setlocal syntax=shell

    call setline(1,a:cmdline)
    call setline(2,substitute(a:cmdline,'.','=','g'))
    execute 'silent $read !'.escape(a:cmdline,'%#')
    setlocal nomodifiable
    1
  endfunction

  " Open the Rails ApiDock page for the word under cursor, using the 'open'
  " command
  function! OpenRailsDoc(keyword)
    let url = 'http://apidock.com/rails/'.a:keyword
    exec '!'.g:browser.' '.url
  endfunction

  " Open the Ruby ApiDock page for the word under cursor, using the 'open'
  " command
  function! OpenRubyDoc(keyword)
    let url = 'http://apidock.com/ruby/'.a:keyword
    exec '!'.g:browser.' '.url
  endfunction

  " Toggle syntastic error panel
  function! ToggleErrorPanel()
    let old_window_count = winnr('$')
    lclose
    if old_window_count == winnr('$')
      " Nothing was closed, open syntastic error location panel
      Errors
    endif
  endfunction


" Section: commands

  " Shell
  command! -complete=file -nargs=+ Shell call s:RunShellCommand(<q-args>)

  " Ruby code metrics
  command! -complete=file -nargs=+ Reek :Shell reek <q-args>
  command! -complete=file -nargs=+ Roodi :Shell roodi <q-args>
  command! -complete=file -nargs=+ Flog :Shell flog -m -I lib <q-args> 2>/dev/null


" Section: mappings

  " Tab navigation
  nmap <leader>tn :tabnext<CR>
  nmap <leader>tp :tabprevious<CR>
  nmap <leader>te :tabedit

  " Remap F1 from Help to ESC.  No more accidents.
  nmap <F1> <Esc>
  map! <F1> <Esc>

  " insert hashrocket, =>, with control-l
  imap <C-l> <Space>=><Space>
  
  " remap ESC keys to jj and kk
  imap jj <ESC>
  imap kk <ESC>

  " align hashrockets with <leader>t control-l
  vmap <leader>t<C-l> :Align =><CR>

  " Toggle NERDTree with <leader>d
  map <silent> <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

  " search next/previous -- center in page
  nmap n nzz
  nmap N Nzz
  nmap * *Nzz
  nmap # #nzz

  " Copies the current file path to the clipboard
  :nnoremap <Leader>cp :let @+=expand('%:p')<CR>
  :nnoremap <Leader>cl :let @+=expand('%') . ':' . line('.')<CR>

  vnoremap <C-C> "+y
  vnoremap <C-Insert> "+y


  " Yank from the cursor to the end of the line, to be consistent with C and D.
  nnoremap Y y$

  " Hide search highlighting
  map <silent> <leader>' :nohls <CR>

  " toggle Quickfix window with <leader>q
  noremap <silent> <leader>q <Plug>QfCtoggle

  nnoremap <leader>irb :<C-u>below new<CR>:setfiletype irb<CR>:set syntax=ruby<CR>:set buftype=nofile<CR>:set bufhidden=delete<CR>i

  " Easily lookup documentation on apidock
  noremap <leader>rb :call OpenRubyDoc(expand('<cword>'))<CR>
  noremap <leader>rr :call OpenRailsDoc(expand('<cword>'))<CR>

  " Easily spell check
  " http://vimcasts.org/episodes/spell-checking/
  "nmap <silent> <leader>s :set spell!<CR>

  map <C-c>n :cnext<CR>
  map <C-c>p :cprevious<CR>

  " Move through window panels
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l

  nnoremap <Up>    3<C-w>-
  nnoremap <Down>  3<C-w>+
  nnoremap <Left>  3<C-w><
  nnoremap <Right> 3<C-w>>

  nnoremap _ :split<cr>
  nnoremap \| :vsplit<cr>


  noremap \= :Tab /=<CR>
  noremap \: :Tab /^[^:]*:\zs/l0l1<CR>
  noremap \> :Tab /=><CR>
  noremap \, :Tab /,\zs/l0l1<CR>
  noremap \{ :Tab /{<CR>
  noremap \\| :Tab /\|<CR>
  noremap \& :Tab /\(&\\|\\\\\)<CR>


  " paste mode
  set pastetoggle=<F2>
  nmap <silent> <F2> :set invpaste<CR>

  " wrap
  nmap <silent> <F3> :set invwrap<CR>

  " highlight
  map <Leader>/ :nohlsearch<cr>

  map <Home> :tprev<CR>
  map <End>  :tnext<CR>

  map <PageDown> :lnext<CR>
  map <PageUp>   :lprev<CR>

  " Undo
  set undolevels=10000

  " Allow undoes to persist even after a file is closed
  if has("persistent_undo")
    set undodir=~/.vim/undo 
    set undofile
  endif

  vnoremap . :normal .<CR>
  vnoremap @ :normal! @

  " Git
  map <silent> <Leader>gd :Gdiff<CR>
  map <silent> <Leader>gb :Gblame<CR>
  map <silent> <Leader>gg :Gbrowse<CR>
  nnoremap gdh :diffget //2<CR>
  nnoremap gdl :diffget //3<CR>

  nmap <leader>gi :Gist
  let g:gist_post_private = 1
  let g:gist_open_browser_after_post = 1

  " Source custom vim from ~/.custom.vim
  if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
  endif

  " Accessibility
  nnoremap * m`:keepjumps normal! *<cr>``

  " Error panel
  nnoremap <leader>er :call ToggleErrorPanel()<CR>

  " Rails
  nmap <Leader>b obyebug<ESC>

  let g:airline#extensions#tabline#enabled = 1
  let g:airline_theme='solarized'
  let g:airline_solarized_bg='dark'

  " FZF
  nnoremap <leader><leader> :Buffers<CR>
  nnoremap <silent><leader>. :Files<CR>
  nnoremap <leader><CR> :GFiles<CR>
  nnoremap <leader>fi :Files<CR>
  nnoremap <leader>C :Colors<CR>
  nnoremap <leader>fl :CustomBLines<CR>

  nnoremap <leader>ft :BTags<CR>
  nnoremap <leader>ag :Ag! <C-R><C-W><CR>
  nnoremap <leader>m :History<CR>

  " RG
  nmap <Leader>/ <Plug>RgRawSearch
  vmap <Leader>/ <Plug>RgRawVisualSelection
  nmap <Leader>* <Plug>RgRawWordUnderCursor

  " Specs
  nnoremap <leader>s. :Dtl<CR><CR>
  nnoremap <leader>st :Dts<CR><CR>
  nnoremap <leader>sd :Dtd<CR><CR>
  nnoremap <leader>sf :Dtf<CR><CR>
  nnoremap <leader>sl :CustomBLinesInSpec<CR>
  nnoremap <leader>sa :Dta<CR><CR>

  nnoremap <A>. :call MoveToNextTab()<CR>
  nnoremap <A>, :call MoveToPrevTab()<CR>

	" Plugin: qf
	nmap <F5>   <Plug>QfSwitch
	nmap <F6>   <Plug>QfCtoggle
	nmap <F7>   <Plug>QfCprevious
	nmap <F8>   <Plug>QfCnext
	nmap <C-F6> <Plug>QfLtoggle
	nmap <C-F7> <Plug>QfLprevious
	nmap <C-F8> <Plug>QfLnext

  nnoremap <leader>fq :SearchCurrentQFList<CR>

  " Folding
  nmap <leader>zr zfir

" Functions

  " FZF
	function! s:build_quickfix_list(lines)
		call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
		copen
		cc
	endfunction

	let g:fzf_action = {
		\ 'ctrl-q': function('s:build_quickfix_list'),
		\ 'ctrl-t': 'tab split',
		\ 'ctrl-x': 'split',
		\ 'ctrl-v': 'vsplit' }

	let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

	" Customize fzf colors to match your color scheme
	" - fzf#wrap translates this to a set of `--color` options
  "let g:fzf_colors =
  "\ { 'fg':      ['fg', 'Normal'],
    "\ 'bg':      ['bg', 'Normal'],
    "\ 'hl':      ['fg', 'Comment'],
    "\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    "\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    "\ 'hl+':     ['fg', 'Statement'],
    "\ 'info':    ['fg', 'PreProc'],
    "\ 'border':  ['fg', 'Ignore'],
    "\ 'prompt':  ['fg', 'Conditional'],
    "\ 'pointer': ['fg', 'Exception'],
    "\ 'marker':  ['fg', 'Keyword'],
    "\ 'spinner': ['fg', 'Label'],
    "\ 'header':  ['fg', 'Comment'] }

  let g:fzf_colors =
  \ { 'fg+':     ['fg', 'Normal'],
    \ 'bg+':     ['bg', 'Normal'],
    \ 'hl+':     ['fg', 'Comment'],
    \ 'fg':      ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg':      ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl':      ['fg', 'Statement'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'border':  ['fg', 'Ignore'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment'] }

  command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
    \   fzf#vim#with_preview(), <bang>0)


  command! -bang -nargs=* CustomBLines call fzf#vim#buffer_lines(<q-args>, {'options': ['--no-sort']}, <bang>0)

  "command! -bang -nargs=* CustomBLinesInSpec call fzf#vim#buffer_lines(<q-args>, {'options': ['--no-sort', '--query "''describe | ''context"']}, <bang>0)
  "command! -bang -nargs=* CustomBLinesInSpec
    "\ call fzf#vim#grep(
    "\   'rg --with-filename --column --line-number --no-heading --color=always --smart-case . '.fnameescape(expand('%')), 1,
    "\   fzf#vim#with_preview({'options': '--delimiter : --nth 4.. --no-sort --preview "bat -p --color always {}" --query "''describe | ''context"'}, 'right:60%', '?'),
    "\   1)

  command! -bang -nargs=* CustomBLinesInSpec
    \ call fzf#vim#grep(
    \   'rg  --line-number --no-heading --color=always --smart-case . '.fnameescape(expand('%')), 1,
    \   fzf#vim#with_preview({'options': '--no-sort --query "''describe | ''context | ''it"'}, '', '?'),
    \   1)

    "\   fzf#vim#with_preview({'options': ["--delimiter", ":", "--nth", "4..", "--no-sort", "--preview", "bat", "-p", "--color", "always", "{}", "--query", "'describe | 'context"]}, 'right:60%', '?'),

  "command! -bang -nargs=* CustomBLines
    "\ call fzf#vim#grep(
    "\   'rg --with-filename --column --line-number --no-heading --color=always --smart-case . '.fnameescape(expand('%:p')), 1)
    "\   fzf#vim#with_preview({'options': '--keep-right --no-sort --delimiter : --nth 4.. --preview "bat -p --color always {}"'}, 'right:60%' ))


  command! -bang -nargs=* SearchCurrentQFList
    \ call fzf#vim#grep(
    \   'rg --with-filename --column --line-number --no-heading --color=always --smart-case . '.join(map(getqflist(), "bufname(v:val['bufnr'])")), 1,
    \   fzf#vim#with_preview({'options': '--delimiter : --nth 4.. --no-sort'}, 'up:50%', '?'),
    \   1)

  command! -bang -nargs=* LinesWithPreview
    \ call fzf#vim#grep(
    \   'rg --with-filename --column --line-number --no-heading --color=always --smart-case . '.fnameescape(expand('%')), 1,
    \   fzf#vim#with_preview({'options': '--delimiter : --nth 4.. --no-sort --preview "bat -p --color always {}"'}, 'right:60%', '?'),
    \   1)

  function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --no-sort --color=always --smart-case %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
  endfunction

  command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

  "command! Dts exe "!tmux send -t 1 q C-u 'rspec --color --tty " . expand("%") . ":" . line(".") . " | less -r' Enter Enter"
  "command! Dtd exe "!tmux send -t 1 q C-u 'rspec --color --tty " . expand("%") . ":" . line(".") . "' Enter Enter"
  "command! Dtf exe "!tmux send -t 1 q C-u 'rspec --color --tty " . expand("%") " | less -r' Enter"
  "command! Dta exe "!tmux send -t 1 q C-u 'rspec --color --tty | less -r' Enter"
  "command! Dtl exe "!tmux send -t 1 q C-u '!!' Enter"

  command! Dts exe "!tmux send -t 1 q C-u 'rspec --color --tty " . expand("%") . ":" . line(".") . "' Enter Enter"
  command! Dtd exe "!tmux send -t 1 q C-u 'rspec --color --tty " . expand("%") . ":" . line(".") . "' Enter Enter"
  command! Dtf exe "!tmux send -t 1 q C-u 'rspec --color --tty " . expand("%") "' Enter"
  command! Dta exe "!tmux send -t 1 q C-u 'rspec --color --tty' Enter"
  command! Dtl exe "!tmux send -t 1 q C-u '!!' Enter"

  function! Send_to_tmux(visual, count) range abort
			if (a:visual)
					execute "normal! gv\"zy"
			else
					execute "normal! \"zyip"
			endif
			let text = @z
			let text = substitute(text, ';', '\\;', 'g')
			let text = substitute(text, '"', '\\"', 'g')
			let text = substitute(text, '\n', '" Enter "', 'g')
			let text = substitute(text, '!', '\\!', 'g')
			let text = substitute(text, '%', '\\%', 'g')
			let text = substitute(text, '#', '\\#', 'g')
			silent execute "!tmux send-keys -t " . a:count . " -- \"" . text . "\""
			silent execute "!tmux send-keys -t " . a:count . " Enter"
			execute "redraw!"
	endfunction
	nnoremap <Leader>p :<C-u>call Send_to_tmux(0, v:count1)<CR>
	xnoremap <Leader>p :<C-u>call Send_to_tmux(1, v:count1)<CR>

	nnoremap <Leader>f :%SlimeSend<CR>
	xnoremap <Leader>f :%SlimeSend<CR>

  "vim-visual-multi
  let g:VM_maps = {}
  let g:VM_maps["Undo"] = 'u'
  let g:VM_maps["Redo"] = '<C-r>'

  function MoveToPrevTab()
    "there is only one window
    if tabpagenr('$') == 1 && winnr('$') == 1
      return
    endif
    "preparing new window
    let l:tab_nr = tabpagenr('$')
    let l:cur_buf = bufnr('%')
    if tabpagenr() != 1
      close!
      if l:tab_nr == tabpagenr('$')
        tabprev
      endif
      sp
    else
      close!
      exe "0tabnew"
    endif
    "opening current buffer in new window
    exe "b".l:cur_buf
  endfunc

  function MoveToNextTab()
    "there is only one window
    if tabpagenr('$') == 1 && winnr('$') == 1
      return
    endif
    "preparing new window
    let l:tab_nr = tabpagenr('$')
    let l:cur_buf = bufnr('%')
    if tabpagenr() < tab_nr
      close!
      if l:tab_nr == tabpagenr('$')
        tabnext
      endif
      sp
    else
      close!
      tabnew
    endif
    "opening current buffer in new window
    exe "b".l:cur_buf
  endfunc

  function! s:list_buffers()
		redir => list
		silent ls
		redir END
		return split(list, "\n")
	endfunction

	function! s:delete_buffers(lines)
		execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
	endfunction

	command! BD call fzf#run(fzf#wrap({
		\ 'source': s:list_buffers(),
		\ 'sink*': { lines -> s:delete_buffers(lines) },
		\ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
	\ }))


runtime macros/matchit.vim
let g:fzf_layout = { 'window': 'enew' }
