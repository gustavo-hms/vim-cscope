if !has("cscope")
	finish
endif

function! LoadCscope()
	let db = findfile("cscope.out", ".;")
	if (!empty(db))
		let path = strpart(db, 0, match(db, "/cscope.out$"))
		set nocscopeverbose " suppress 'duplicate connection' error
		exe "cs add " . db . " " . path
		set cscopeverbose
	endif
endfunction
au VimEnter * call LoadCscope()

function! UpdateCscope()
	let db = findfile("cscope.out", ".;")
	if (!empty(db))
		let oldpath = getcwd()
		let path = strpart(db, 0, match(db, "/cscope.out$"))
		exe "cd " . path
		!cscope -Rbq
		exe "cd " . oldpath
	endif
endfunction
au VimEnter * call UpdateCscope()
