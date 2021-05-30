FROM python:3.9alpine3.12

WORKDIR app/
COPY files/ .

WORKDIR /app
ENV FLASK_RUN_HOST=0.0.0.0
RUN apk add --no-cache gcc musl-dev linux-headers
COPY requirements.txt .
RUN pip install -r requirements.txt
