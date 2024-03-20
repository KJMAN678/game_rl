# ベースイメージを指定
FROM ubuntu:latest

RUN apt update -y
RUN apt upgrade -y
RUN apt-get install curl sudo git -y

# タイムゾーン選択で止まらないようにタイムゾーンを設定
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# Python の関連パッケージをインストール
RUN apt install build-essential libbz2-dev libdb-dev \
libreadline-dev libffi-dev libgdbm-dev liblzma-dev \
libncursesw5-dev libsqlite3-dev libssl-dev \
zlib1g-dev uuid-dev tk-dev -y --fix-missing
RUN sudo apt install python3-pip -y

# Node.js の関連パッケージをインストール
RUN apt remove --purge nodejs -y
RUN curl -fsSL https://deb.nodesource.com/setup_21.x | sudo -E bash -
RUN sudo apt-get install -y nodejs

# node.js の環境変数を定義する
# 本番環境では production
ENV NODE_ENV=development

# ディレクトリを移動する
WORKDIR /app
COPY . /app/

RUN git clone --depth 1 https://github.com/smogon/pokemon-showdown.git /app/pokemon-showdown/
RUN cp /app/pokemon-showdown/config/config-example.js /app/pokemon-showdown/config/config.js
RUN cd pokemon-showdown
RUN npm install
RUN cd ..
COPY ./app/pikemon-showdown /app/
RUN pip install --no-cache-dir --upgrade pip
RUN pip --default-timeout=1000 install --no-cache-dir --upgrade -r app/requirements.txt


# ポート3000番を開放する
EXPOSE 8000

CMD [ "node", "pokemon-showdown", "start", "--no-security" ]
