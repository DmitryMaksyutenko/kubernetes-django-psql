FROM python:3.9

WORKDIR /app

COPY ./test_kuber /app/test_kuber
COPY ./pdm.lock /app
COPY ./pyproject.toml /app

RUN pip install pdm

RUN pdm install

WORKDIR /app/test_kuber

CMD ["pdm", "run", "python", "manage.py", "runserver", "0.0.0.0:8080"]
