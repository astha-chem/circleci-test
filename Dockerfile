FROM python:3.9

WORKDIR /app

COPY . /app
# Instead of copying everything, copy only the required files
# For example, if you need requirements.txt and application.py:
COPY artifacts/raw/ /app/artifacts/raw/
COPY pipeline/ /app/pipeline/
COPY src/ /app/src/
COPY templates/ /app/templates/
COPY static/ /app/static/
COPY requirements.txt application.py gcp-key.json kubernetes-deployment.yaml setup.py /app/

RUN pip install --no-cache-dir -e .

EXPOSE 5000

ENV FLASK_APP=application.py

CMD ["python" , "application.py"]
