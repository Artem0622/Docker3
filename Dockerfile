# Stage 1: Build Stage
FROM python:3.10-slim AS builder

WORKDIR /usr/src/app

RUN pip install numpy
COPY myapp /usr/src/app
COPY requirements.txt /usr/src/app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Stage 2: Production Stage
FROM python:3.10-slim

WORKDIR /usr/src/app

# Copy only necessary files from the builder stage
COPY --from=builder /usr/src/app /usr/src/app

EXPOSE 5000

CMD ["python", "app.py"]

