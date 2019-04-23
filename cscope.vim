if has("cscope")
		set csprg=/usr/local/bin/cscope
		set csto=0
		set cst
		" add any database in current directory
		if filereadable("cscope.out")
		    silent! cs add cscope.out
		" else add database pointed to by environment
		elseif $CSCOPE_DB != ""
		    silent! cs add $CSCOPE_DB
		endif
endif
