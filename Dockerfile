FROM python:3.11-slim-bullseye
WORKDIR /app
RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/nzo66/EasyProxy.git .
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 7860
CMD ["gunicorn", "--bind", "0.0.0.0:7860", "--workers", "4", "--worker-class", "aiohttp.worker.GunicornWebWorker", "--timeout", "120", "--graceful-timeout", "120", "app:app"]
