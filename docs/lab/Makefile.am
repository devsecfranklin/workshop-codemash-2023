CLOCAL_AMFLAGS = -I config/m4 -I aclocal

clean:
	@for trash in *.aux *.bbl *.blg *.lof *.log *.lot *.out *.pdf *.synctex.gz *.toc ; do \
		if [ -f "$$trash" ]; then \
			rm -rf $$trash ; \
		fi ; \
	done

paper:
	bibtex workshop-codemash-2023
	latexmk -pdf -file-line-error -interaction=nonstopmode -synctex=1 -shell-escape workshop-codemash-2023
