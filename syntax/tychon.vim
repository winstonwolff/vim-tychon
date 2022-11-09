" Language:    Tychon

" Bail if our syntax is already loaded.
if exists('b:current_syntax') && b:current_syntax == 'tychon'
  finish
endif

" Highlight long strings.
syntax sync fromstart

syn region tychonString start=/"/ skip=/\\\\\|\\"/ end=/"/
syn region tychonString start=/'/ skip=/\\\\\|\\'/ end=/'/
hi def link tychonString String

" The first case matches symbol operators only if they have an operand before.
" syn match tychonExtendedOp /\%(\S\s*\)\@<=[+\-*/%&|\^=!<>?.]\{-1,}\|[-=]>\|--\|++\|:/
" \                          display
" syn match tychonExtendedOp /\<\%(and\|or\)=/ display
" hi def link tychonExtendedOp tychonOperator

" A integer, including a leading plus or minus
syn match tychonNumber /\%(\i\|\$\)\@<![-+]\?\d\+\%(e[+-]\?\d\+\)\?/ display
hi def link tychonNumber Number

" A floating-point number, including a leading plus or minus
syn match tychonFloat /\%(\i\|\$\)\@<![-+]\?\d*\.\@<!\.\d\+\%([eE][+-]\?\d\+\)\?/
\                     display
hi def link tychonFloat Float

syn match tychonComment /#.*/
hi def link tychonComment Comment

syntax keyword tychonKeywords
            \ __scope__
            \ export
            \ func
            \ import
            \ macro
            \ print
highlight default link tychonKeywords Keyword

" A class-like name that starts with a capital letter
syn match tychonObject /\<\u\w*\>/ display
hi def link tychonObject Structure

" A constant-like name in SCREAMING_CAPS
syn match tychonConstant /\<\u[A-Z0-9_]\+\>/ display
hi def link tychonConstant Constant

" syn match tychonBoolean /\<\%(True\|False\)\>/ display
" hi def link tychonBoolean Boolean

" An error for trailing whitespace, as long as the line isn't just whitespace
syn match tychonSpaceError /\S\@<=\s\+$/ display
hi def link tychonSpaceError Error

syntax match tychonFunction /\<\h\w*\>(/ display
hi def link tychonFunction Function
syntax match tychonColonFunction /\<\h\w*\>::/ display
hi def link tychonColonFunction Function

if !exists('b:current_syntax')
  let b:current_syntax = 'tychon'
endif
