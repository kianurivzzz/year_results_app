FROM python:3.7-alpine
COPY . /app
WORKDIR /app
RUN pip install .
RUN year_results_app create-db
RUN year_results_app populate-db
RUN year_results_app add-user -u admin -p admin
EXPOSE 5000
CMD ["year_results_app", "run"]
