FROM python:3.9.0b5-alpine3.12

COPY requirements.txt /app/requirements.txt
COPY app.py /app/app.py

WORKDIR /app
RUN pip install -r requirements.txt

ENTRYPOINT [ "flask", "run", "--host=0.0.0.0" ]
