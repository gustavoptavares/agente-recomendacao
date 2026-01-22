FROM python:3.11-slim

WORKDIR /app

# Instalar dependências do sistema necessárias (opcional, mas recomendado)
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Copiar arquivos de dependência
COPY requirements.txt .

# Instalar pacotes Python
RUN pip install --no-cache-dir -r requirements.txt

# Copiar todo o código do projeto para o container
COPY . .

# Definir variável de ambiente para Python não usar buffer no stdout
ENV PYTHONUNBUFFERED=1

# O comando final é gerenciado pelo LangGraph Studio, não precisa de CMD aqui