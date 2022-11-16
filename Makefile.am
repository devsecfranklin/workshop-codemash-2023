CLOCAL_AMFLAGS = -I config/m4 -I aclocal
ACLOCAL_AMFLAGS = -I config/m4 -I aclocal

.PHONY: terraform

clean: ## Clean up your mess
	rm -rf _build *.egg-info
	@find . -name '*.pyc' | xargs rm -rf
	@find . -name '__pycache__' | xargs rm -rf

docker:
	docker build -t gcr.io/gcp-gcs-pso/cloudbot-dev .
	docker run -it -v $(pwd):/home/franklin gcr.io/gcp-gcs-pso/cloudbot-dev:latest bash

python:
	@$(PY39) -m venv _build
	( \
		source _build/bin/activate; \
		_build/bin/python -m pip install --upgrade pip; \
		_build/bin/python -m pip install -r lab/requirements.txt; \
		_build/bin/python -m pip install -r src/requirements.txt; \
	)

terraform:
	curl -LO https://raw.github.com/robertpeteuil/terraform-installer/master/terraform-install.sh
	chmod +x terraform-install.sh

test: 
	@$(PY39) -m venv _build
	( \
		source _build/bin/activate; \
		_build/bin/python -m pip install --upgrade pip; \
		_build/bin/python -m pip install tox; \
		_build/bin/python -m pip install -r tests/requirements-test.txt; \
		_build/bin/python -m pip install -r tests/requirements-security.txt; \
	)
