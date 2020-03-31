
view: vbmeta.svg
	xdg-open $<

vbmeta.svg: vbmeta.dot
	dot -Tsvg $< -o $@

vbmeta.dot: vbmeta.ksy
	kaitai-struct-compiler $< -t graphviz

.PHONY: view
