FROM python:3.11-slim-bookworm

EXPOSE 8080

WORKDIR /app

RUN apt-get update \
    && apt-get install -y git \
    && git clone https://github.com/HibiKier/zhenxun_bot.git --depth=1 zhenxun \
    && cd zhenxun \
    && pip install poetry \
    && poetry install \
    && poetry run playwright install --with-deps chromium

CMD ["poetry", "run", "python", "bot.py"]
