# 1. Imagem Base
# Usando uma imagem oficial do Python com Alpine Linux. É leve e contém o Python.
# A versão 3.10 é especificada no readme.md do projeto.
FROM python:3.10-alpine

# 2. Definir variáveis de ambiente
# Evita que o Python grave arquivos .pyc no container
ENV PYTHONDONTWRITEBYTECODE 1
# Garante que a saída do Python seja enviada diretamente para o terminal (útil para logs)
ENV PYTHONUNBUFFERED 1

# 3. Definir o diretório de trabalho
WORKDIR /app

# 4. Instalar dependências
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copiar o código da aplicação
COPY . .

# 6. Expor a porta em que a aplicação será executada
EXPOSE 8000

# 7. Comando para iniciar a aplicação
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000" , "--reload" ]
