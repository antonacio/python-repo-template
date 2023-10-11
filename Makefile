# Need to specify bash in order for conda activate to work.
SHELL=/bin/bash
# conda environment name
CONDA_ENV_NAME=env_name

# Conda install environment
# Note that the extra activate is needed to ensure that the activate floats env to the front of PATH
install:
	conda env update -f src/environment.yml --prune && \
	source $$(conda info --base)/etc/profile.d/conda.sh && \
	conda activate && conda activate ${CONDA_ENV_NAME} && \
	pip install pre-commit && \
	pre-commit install

lint:
	pre-commit run -a

test:
	python -m pytest
