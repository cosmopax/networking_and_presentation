all:
	@docker run --rm -v "$(PWD)/..:/data" -w /data/src_latex blang/latex:ubuntu latexmk -pdf -outdir=../out main.tex
clean:
	rm -rf ../out/*
