
let s:f1=        "function! ClipboardWrite(lines,regtype)\n"
let s:f1= s:f1.  "    let @9=@8\n"
let s:f1= s:f1.  "    let @8=@7\n"
let s:f1= s:f1.  "    let @7=@6\n"
let s:f1= s:f1.  "    let @6=@5\n"
let s:f1= s:f1.  "    let @5=@4\n"
let s:f1= s:f1.  "    let @4=@3\n"
let s:f1= s:f1.  "    let @3=@2\n"
let s:f1= s:f1.  "    let @2=@1\n"
let s:f1= s:f1.  "    let @1=@0\n"
let s:f1= s:f1.  "    let @\"=join(a:lines,\"\\n\")\n"
let s:f1= s:f1.  "    py3 pwp.run_pycode(pycode[\"clipboard_update_xorg\"][\"code\"])\n"
let s:f1= s:f1.  "    call system(['dd', 'of=" . $CLIPBOARD_FILE . "'] , a:lines )\n"
let s:f1= s:f1.  "    call system(['dd', 'of=". $CLIPBOARD_META_FILE . "' ] , a:regtype )\n"
let s:f1= s:f1.  "endfunction"
exe s:f1

        "py3 f=open('/dev/shm/sodufosuuu','ab');f.write(b'\\x00\\x00');f.close()
        "py3 pwp.run_pycode(pycode['split_clipboard']['code'])

let s:f2 =        "function! ClipboardRead()\n"
let s:f2 = s:f2 . "    let lines =   system('cat " . $CLIPBOARD_FILE ."')\n"
let s:f2 = s:f2 . "    let regtype = system('cat " . $CLIPBOARD_META_FILE ."')\n"
let s:f2 = s:f2 . '    return [split(lines,''\n'') , regtype ]'."\n"
let s:f2 = s:f2 . "endfunction\n"
exe s:f2

"echo s:f1
"echo s:f2
