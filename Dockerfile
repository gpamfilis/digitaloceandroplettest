FROM python:3.10

WORKDIR /code

RUN pip install poetry==1.1.12

RUN pip install --upgrade pip

COPY pyproject.toml poetry.lock ./
RUN poetry export -f requirements.txt -o requirements.txt --without-hashes
RUN pip install -r requirements.txt
EXPOSE 5000
COPY ./ /code
CMD [ "flask", "run", "-h", "0.0.0.0" ]