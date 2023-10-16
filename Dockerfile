FROM mcr.microsoft.com/azure-cli:latest-amd64 as base
LABEL maintainer="Maltem"
RUN apk update
RUN apk upgrade
RUN apk add --no-cache unixodbc-dev g++
RUN apk --no-cache add curl
RUN apk --no-cache add gnupg
RUN apk --no-cache add git
RUN apk --update add --virtual build-dependencies --no-cache wget tar
RUN apk --update add libc6-compat ca-certificates
RUN curl -O https://download.microsoft.com/download/e/4/e/e4e67866-dffd-428c-aac7-8d28ddafb39b/msodbcsql17_17.10.4.1-1_amd64.apk
RUN curl -O https://download.microsoft.com/download/e/4/e/e4e67866-dffd-428c-aac7-8d28ddafb39b/mssql-tools_17.10.1.1-1_amd64.apk
RUN curl -O https://download.microsoft.com/download/e/4/e/e4e67866-dffd-428c-aac7-8d28ddafb39b/msodbcsql17_17.10.4.1-1_amd64.sig
RUN curl -O https://download.microsoft.com/download/e/4/e/e4e67866-dffd-428c-aac7-8d28ddafb39b/mssql-tools_17.10.1.1-1_amd64.sig
RUN apk add --allow-untrusted msodbcsql17_17.10.4.1-1_amd64.apk
RUN apk add --allow-untrusted mssql-tools_17.10.1.1-1_amd64.apk
RUN apk --update add gcc build-base freetype-dev libpng-dev openblas-dev
RUN pip install -q --no-cache-dir -U pip dbt-sqlserver
RUN pip install -q --no-cache-dir dbt-sqlserver
RUN pip install -q --no-cache-dir azure-storage-blob
RUN pip install -q --no-cache-dir azure-identity
RUN pip install -q --no-cache-dir azure-keyvault-secrets
RUN pip install -q --no-cache-dir pandas
COPY  . /
ARG KV_NAME
ENV PYTHONIOENCODING=utf-8
ENV LANG=C.UTF-8
ENV DOCKER_CLI_HINTS=false
ENV KV_NAME="daprod-keyvault"
CMD git clone https://github.com/SermadMehdi/DBT.git dbt-workplace-main; \
    cd dbt-workplace-main; \
    mkdir -p airtrunk_dbt/utilities; \
    mv utilities/* airtrunk_dbt/utilities/; \
    cd service_now; \
    git pull; \
    dbt build --target prod | tee dbt_log.txt; \
    dbt docs generate --target prod --no-compile; \
    cd ../dbt_log; \
    dbt build; \
    echo 'Completed'
