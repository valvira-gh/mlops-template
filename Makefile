install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	#python -m pytest -vv --cov=main --cov=calCLI --cov=mylib tests/*.py

format:
	#black *.py

lint:
	#pylint --disable=R,C --extension-pkg-whitelist=pydantic main.py --ignore=test_*.py mylib/*.py

container-lint:
	#docker run --rm -i hadolint/hadolint < Dockerfile

refactor: format lint

depoy:
	#docker build -t flask-app:latest .
	#docker run -d -p 5000:5000 flask-app

all: install lint test format deploy