FROM node:16.18-alpine

RUN apk add git

RUN git clone https://github.com/Abu-Zakaria/lets-chat.git /opt/app

RUN mkdir /opt/scripts
COPY playbooks/scripts/app /opt/scripts
COPY playbooks/vault_files/db_password.txt /etc/db_password.txt
COPY db01_ip_address.txt /etc/db01_ip_address.txt

WORKDIR /opt/app

RUN npm install

ENTRYPOINT ["npm", "start"]

