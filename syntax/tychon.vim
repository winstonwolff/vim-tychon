" Language:    Tychon

" Bail if our syntax is already loaded.
if exists('b:current_syntax') && b:current_syntax == 'tychon'
  finish
endif

" Highlight long strings.
syntax sync fromstart

" The first case matches symbol operators only if they have an operand before.
syn match coffeeExtendedOp /\%(\S\s*\)\@<=[+\-*/%&|\^=!<>?.]\{-1,}\|[-=]>\|--\|++\|:/
\                          display
syn match coffeeExtendedOp /\<\%(and\|or\)=/ display
hi def link coffeeExtendedOp coffeeOperator

syn match coffeeBoolean /\<\%(True\|False\)\>/ display
hi def link coffeeBoolean Boolean

" A class-like name that starts with a capital letter
syn match coffeeObject /\<\u\w*\>/ display
hi def link coffeeObject Structure

" A constant-like name in SCREAMING_CAPS
syn match coffeeConstant /\<\u[A-Z0-9_]\+\>/ display
hi def link coffeeConstant Constant

" An error for trailing whitespace, as long as the line isn't just whitespace
syn match coffeeSpaceError /\S\@<=\s\+$/ display
hi def link coffeeSpaceError Error

if !exists('b:current_syntax')
  let b:current_syntax = 'tychon'
endif
