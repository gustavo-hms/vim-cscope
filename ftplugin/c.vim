" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
	finish
endif
let b:did_ftplugin = 1

nnoremap <buffer> <F5> :call SwitchHeaderSource()<CR>
nnoremap <buffer> <cr> :cs find g <C-R>=expand("<cword>")<CR><CR>

if !exists("*SwitchHeaderSource")
	function SwitchHeaderSource()
lua << EOF
		local extension
		local original_extension = vim.eval "expand(\"%:e\")"
		if original_extension == "c" then
			extension = "H"
		elseif original_extension == "H" or original_extension == "h" then
			extension = "c"
		end
		
		vim.command("cscope find f %:t:r." .. extension)
EOF
	endfunction
endif

"if !exists("*Inclusions")
command! Inclusions cs find i %:t
"endif
