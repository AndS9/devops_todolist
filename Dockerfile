ARG PYTHON_VERSION=3.12

FROM python:${PYTHON_VERSION}

LABEL authors="Andrii Shukalo"
WORKDIR /app
RUN git clone https://github.com/mate-academy/devops_todolist

ENV PYTHONUNBUFFERED=1
WORKDIR /app/devops_todolist
RUN pip install -r requirements.txt
RUN python manage.py migrate

EXPOSE 8000
ENTRYPOINT ["python", "manage.py runserver 0.0.0.0:8000"]