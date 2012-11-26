nnoremap <Leader>f :call FindFile()<CR>

function! FindFile()
	let fileName = input("Type the name of the file: ")
	execute "cs find f " . fileName
	if line("'\"") > 0 && line("'\"") <= line("$")
		execute 'normal! g`"'
	endif
endfunction
