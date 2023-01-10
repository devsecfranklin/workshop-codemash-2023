CLOCAL_AMFLAGS = -I config/m4 -I aclocal
ACLOCAL_AMFLAGS = -I config/m4 -I aclocal

.PHONY: docs python test terraform

clean: ## Clean up your mess
	rm -rf _build *.egg-info
	@find . -name '*.pyc' | xargs rm -rf
	@find . -name '__pycache__' | xargs rm -rf
	@for trash in _build aclocal.m4 autom4te.cache config config.in config.in~ config.log config.status configure configure~ libtool Makefile Makefile.in docker/cloudbot/Makefile docker/cloudbot/Makefile.in po stamp-h1 terraform-install.sh; do \
	if [ -f $$trash ] || [ -d $$trash ]; then \
		echo "Removing $$trash" ;\
		rm -rf $$trash ;\
	fi ; \
	done

docs:
	$(MAKE) python
	( \
		source _build/bin/activate; \
		_build/bin/python -m pip install --upgrade pip; \
		_build/bin/python -m pip install -r docs/requirements.txt; \
	)
	cd docs/slides && $(MAKE) slides

python:
	@echo "Found Python version $(PY39)"
	@$(PYTHON) -m venv _build
	( \
		source _build/bin/activate; \
		_build/bin/python -m pip install --upgrade pip; \
		_build/bin/python -m pip install -r src/requirements.txt; \
	)

test: 
	@$(PY39) -m venv _build
	( \
		source _build/bin/activate; \
		_build/bin/python -m pip install --upgrade pip; \
		_build/bin/python -m pip install tox; \
		_build/bin/python -m pip install -r tests/requirements-test.txt; \
		_build/bin/python -m pip install -r tests/requirements-security.txt; \
	)
