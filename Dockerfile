FROM python:3.12-slim

WORKDIR /app

# Install dependencies first so this layer is cached between code changes
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the app (app.py, templates/, static/)
COPY . .

EXPOSE 5000

# Must bind to 0.0.0.0, or the app won't be reachable from outside the container
CMD ["flask", "--app", "app", "run", "--host=0.0.0.0", "--port=5000"]