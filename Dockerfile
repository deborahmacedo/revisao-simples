FROM python:3.12-slim
WORKDIR /app


COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .
COPY repositorio.py .

RUN useradd --create-home appuser && mkdir /dados && chown appuser /dados
USER appuser

ENV HISTORICO=/dados/historico.log

EXPOSE 5000

CMD ["python", "app.py"]