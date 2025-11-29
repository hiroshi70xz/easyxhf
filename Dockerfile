FROM python:3.11-slim-bullseye
WORKDIR /app
RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/hiroshi70xz/easyxhf.git .
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 8080
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "--workers", "4", "--worker-class", "aiohttp.worker.GunicornWebWorker", "--timeout", "120", "--graceful-timeout", "120", "app:app"]
