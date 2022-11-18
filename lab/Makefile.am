CLOCAL_AMFLAGS = -I config/m4 -I aclocal

clean:
	rm -rf _build *.egg-info
	@for trash in *.aux *.bbl *.blg *.lof *.log *.lot *.out *.pdf *.synctex.gz *.toc ; do \
		if [ -f "$$trash" ]; then \
			rm -rf $$trash ; \
		fi ; \
	done

paper:
	@echo "Found Python version $(PY39)"
	@$(PYTHON) -m venv ../_build
	( \
		source ../_build/bin/activate; \
		../_build/bin/python -m pip install --upgrade pip; \
		../_build/bin/python -m pip install -r requirements.txt; \
	)
	bibtex workshop-codemash-2023
	latexmk -pdf -file-line-error -interaction=nonstopmode -synctex=1 -shell-escape workshop-codemash-2023
