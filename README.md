### ゲーム + 強化学習 + 量子コンピュータ

- poke-env
- gym-super-mario-bros

```sh
# コンテナの作成
docker compose build --no-cache

# コンテナの起動
docker compose up -d

# コンテナ名の確認
docker-compose ps
# コンテナに入る
docker container exec -it game_rl-py3-1 bash

# 必要なライブラリのインストール
npm init -y
npm install pokemon-showdown -y

# jupyter lab の起動
jupyter lab

# ローカルサーバーにアクセス
http://localhost:8888/lab

# コンテナから出る
exit
```

```sh
# pre-commit で notebook のメタデータを削除
# https://note.com/yo4shi80/n/n620988ad8fc8
chmod u+x .git/hooks/pre-commit
```
