# Stage 1
FROM python:3.13-slim AS builder
WORKDIR /app
RUN apt-get update && apt-get -y install libpq-dev libffi-dev gcc
RUN python3 -m venv venv
ENV VIRTUAL_ENV=/app/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
COPY requirements.txt .
RUN pip install -r requirements.txt
 
# Stage 2
FROM python:3.13-slim AS runner
WORKDIR /app
COPY --from=builder /app/venv venv
COPY . .
ENV VIRTUAL_ENV=/app/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
ENV PORT=8000
EXPOSE ${PORT}
RUN chmod +x  /app/entrypoint.prod.sh
CMD ["/app/entrypoint.prod.sh"]
