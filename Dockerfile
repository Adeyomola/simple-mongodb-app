FROM nginx:stable
COPY ./default.conf /etc/nginx/conf.d/
WORKDIR /usr/src/app
COPY ./package*.json /usr/src/app/
RUN ["/bin/bash", "-c", "curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && apt-get update \
&& apt-get install -y nodejs && npm install"]
COPY ./ /usr/src/app/
EXPOSE 3000
CMD [ "node", "index.js" ]
