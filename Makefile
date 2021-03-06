all:
	pandoc \
		-t beamer \
		--pdf-engine=xelatex \
		--template=template.latex \
		-fmarkdown-implicit_figures \
		-V fontfamily="sourcesanspro" \
		-V logo="img/hip_logo.png" \
		-V background-image=img/bg.jpg \
		-V classoption:aspectratio=169 \
		-V geometry:"hmargin=1.85cm, nomarginpar" \
		-o slides.pdf \
		slides.md
