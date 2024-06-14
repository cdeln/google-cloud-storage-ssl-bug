FROM ubuntu:22.04

WORKDIR /app/

ENV DEBIAN_FRONTEND noninteractive

ENV PYTHONUNBUFFERED True

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir \
    google-cloud-storage==2.16.0

COPY main.py .

ENTRYPOINT ["python3", "main.py"]
