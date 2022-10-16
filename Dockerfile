FROM python:alpine
RUN pip install flask
ADD . /app
WORKDIR /app
EXPOSE 80
ENTRYPOINT python ./welcome.py
