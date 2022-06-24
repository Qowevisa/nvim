" Vim syntax file
" Language: Celestia Star Catalogs
" Maintainer: Kevin Lauder
" Latest Revision: 26 April 2008

if exists("b:current_syntax")
  finish
endif


syn keyword OSCLineS Num nextgroup=OSCNum skipwhite
syn match OSCNum '\d\+'
syn match OSCOsc 'OSC\d\+'
" Keywords
" syn keyword OSCSeparators -> : nextgroup=OSCNumOrOsc
syn match OSCSepN '->' nextgroup=OSCNum skipwhite
syn match OSCSepE '::' nextgroup=OSCOsc skipwhite
syn match OSCRepC '|'

syn match OSCComment '*.*$'

syn region OSCRepet start="|" end="|" fold transparent contains=OSCSepN,OSCNum,OSCOsc,OSCSepE

" Matches
" syn match syntaxElementMatch 'regexp' contains=Num nextgroup=Separators skipwhite

" Regions
" syn region syntaxElementRegion start='x' end='y'


"
let b:current_syntax = "osc"

hi def link OSCLineS    Tag
hi def link OSCComment  Comment
hi def link OSCNum      Number
hi def link OSCRepet    Statement
hi def link OSCRepC     Statement
hi def link OSCOsc      Identifier
hi def link OSCSepN     Operator
hi def link OSCSepE     Operator
