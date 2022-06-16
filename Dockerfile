FROM python:3

WORKDIR /app

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

COPY /src .

CMD [ "python", "-m" , "flask", "run", "--host=0.0.0.0"]