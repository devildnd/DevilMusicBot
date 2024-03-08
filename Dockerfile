FROM python:3.10.5-alpine

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN adduser -D appuser

USER appuser

WORKDIR /home/appuser/

COPY --chown=appuser:appuser requirements.txt .

RUN python -m pip install --user --no-cache-dir --disable-pip-version-check --requirement requirements.txt

COPY --chown=appuser:appuser . .

ENTRYPOINT [ "./entrypoint.sh" ]
