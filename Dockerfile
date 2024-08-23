FROM python:3.11-slim-bookworm

EXPOSE 8080

WORKDIR /app/zhenxun

RUN apt-get update \
    && apt-get install -y git \
    && cd /app/zhenxun \ 
    && git clone https://github.com/HibiKier/zhenxun_bot.git --depth=1 \
    && cd zhenxun_bot \
    && pip install poetry \
    && poetry install \
    && poetry run playwright install --with-deps chromium

CMD ["poetry", "run", "python", "bot.py"]
