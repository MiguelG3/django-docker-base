FROM python:3.10-slim-bullseye
ENV PYTHONUNBUFFERED=1

WORKDIR /app

RUN apt-get update && apt-get install -y gcc g++ build-essential python3-dev libpq-dev

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

