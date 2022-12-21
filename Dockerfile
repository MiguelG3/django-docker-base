# Using Python's docker official image as base
FROM python:3.11-slim-bullseye

# ENV variables
ENV PIP_DISABLE_PIP_VERSION_CHECK 1
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

# Installing dependencies for psycopg2 package (PostgreSQL) + git
RUN apt-get update && apt-get install -y gcc g++ build-essential python3-dev libpq-dev git

# Installing Django base packages (Based on my personal needs and choices, feel free to modify as you please)
# review the contents of core/settings.py after removing packages, since it's been configured for some packages
# like django_rest_framework or psycopg2
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .