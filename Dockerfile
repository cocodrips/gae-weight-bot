FROM python:3.6-alpine

ARG project_dir=/works
ADD app $project_dir
ADD requirements.txt $project_dir

WORKDIR $project_dir
RUN pip install -r requirements.txt

RUN apk update
RUN apk add git tree
RUN tree $project_dir
CMD FLASK_APP=web.py flask run