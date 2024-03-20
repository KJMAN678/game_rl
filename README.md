### ゲーム + 強化学習 + 量子コンピュータ

- poke-env
- gym-super-mario-bros

```sh
# コンテナの作成(1回目のみ)
docker compose build --no-cache

# コンテナの起動
docker compose up -d

# コンテナ名 (game_rl-py3-1) の確認
docker-compose ps

# コンテナ (game_rl-py3-1) に入る
docker container exec -it game_rl-py3-1 bash

npm config set prefix "./"

node app/pokemon-showdown start --no-security

# jupyter lab の起動
jupyter lab

# ローカルサーバーにアクセス
http://localhost:8888/lab

# コンテナから出る
exit
```
