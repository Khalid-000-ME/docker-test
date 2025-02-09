# Use a lightweight Python image
FROM python:3.10

# Set working directory
WORKDIR /app

# Copy dependencies
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy application files
COPY . .

# Expose port
EXPOSE 8000

# Run Gunicorn with Flask
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:8000", "app.main:app"]
