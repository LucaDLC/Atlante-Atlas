import sys, pathlib
base = pathlib.Path('base.css').read_text(encoding='utf-8')
for src in sys.argv[1:]:
    p = pathlib.Path(src)
    out = pathlib.Path(p.name.replace('.src.html', '.html'))
    txt = p.read_text(encoding='utf-8')
    if '/*BASE*/' not in txt:
        print('!! no /*BASE*/ marker in', src); continue
    out.write_text(txt.replace('/*BASE*/', base), encoding='utf-8')
    print('built', out, len(out.read_text(encoding="utf-8")), 'bytes')
