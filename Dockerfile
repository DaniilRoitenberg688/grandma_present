# Базовый образ
FROM python:3.9-slim

# Установи рабочую директорию
WORKDIR /app

# Скопируй зависимости и установи их
RUN pip install --upgrade pip
RUN pip install --no-cache-dir gunicorn flask

# Скопируй весь код
COPY . .

# Открой порт 5000
EXPOSE 5000

# Запусти Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
