" folding for Markdown headers, both styles (atx- and setex-)
" http://daringfireball.net/projects/markdown/syntax#header
"
" this code can be placed in file
"   $HOME/.vim/after/ftplugin/markdown.vim

func! Foldexpr_markdown(lnum)
    let l1 = getline(a:lnum)
    " ignore empty lines
    if l1 =~ '^\s*$'
        return '='
    endif
    " next line is underline
    let l2 = getline(a:lnum+1)
    if  l2 =~ '^=\+\s*$'
        return '>1'
    elseif l2 =~ '^-\+\s*$'
        return '>2'
    " current line starts with hashes
    elseif l1 =~ '^#'
        return '>'.matchend(l1, '^#\+')
    " keep previous foldlevel
    else
        return '='
    endif
endfunc
setl foldexpr=Foldexpr_markdown(v:lnum)
setl foldmethod=expr

"---------- everything after this is optional -----------------------
" change the following fold options to your liking
" see ':help fold-options' for more
setl foldenable
setl foldlevel=99
setl foldcolumn=0

" text of closed fold
" shows the first line as is, plus fold level and the number of hidden lines
setl foldtext=getline(v:foldstart).'\ \ \ /'.v:foldlevel.'...'.(v:foldend-v:foldstart)

"-------- other buffer- and window-local settings to override defaults
" setl wrap list
