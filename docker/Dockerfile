FROM node:16.18-alpine

RUN apk add git

RUN git clone https://github.com/Abu-Zakaria/lets-chat.git /opt/app

RUN mkdir /opt/files
COPY /opt/files/ /opt/files/
RUN mkdir /secrets
COPY /secrets/db_password.txt /secrets/db_password.txt
COPY /etc/db01_ip_address.txt /etc/db01_ip_address.txt

WORKDIR /opt/app

RUN /opt/files/setup_app_config_prod.sh

RUN npm install

ENTRYPOINT ["npm", "start"]

