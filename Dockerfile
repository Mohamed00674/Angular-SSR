FROM node:22-bookworm-slim

RUN apt-get update -y && apt-get install -y --no-install-recommends \
  curl \
  wget \
  ca-certificates \
  build-essential \
  python3 \
  gcc \
  g++ \
  make \
  git \
  vim \
  nano \
  unzip \
  gnupg2 \
  libstdc++6 \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app/

COPY package.json package-lock.json ./

RUN npm ci 

RUN npm install -g @angular/cli nodemon

COPY . .


EXPOSE 4000

ADD ./start.sh /usr/src/app/start.sh
RUN chmod +x /usr/src/app/start.sh

ENTRYPOINT ["/usr/src/app/start.sh"]
