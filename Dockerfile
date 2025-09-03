# Imagem base leve de Python
FROM python:3.11-slim

# Evitar prompts interativos
ENV DEBIAN_FRONTEND=noninteractive
# Preferir wheels pré-compiladas (evita compilar numpy/pandas)
ENV PIP_ONLY_BINARY=:all:

WORKDIR /app

# Dependências de sistema mínimas (ajuda se alguma lib precisar)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copiar a lista de dependências primeiro (melhor cache)
COPY requirements.txt ./

# Instalar dependências Python
RUN pip install --no-cache-dir -r requirements.txt

# Copiar o restante do projeto
COPY . .

# Porta padrão; no Render a variável $PORT é fornecida
ENV PORT=8050

# Subir com gunicorn; Render sobrescreve $PORT
CMD gunicorn dashboard_melhorado:app.server --bind 0.0.0.0:${PORT} --workers 2 --threads 4 --timeout 120
