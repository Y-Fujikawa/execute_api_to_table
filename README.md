# execute_api_to_table
APIを実行してテーブルに登録するスクリプト

## Getting Started
1. このリポジトリをクローンしてくる
2. `bundler` をインストールする
   ```rb
   gem install bundler
   ```
3. リポジトリのディレクトリで以下を実行する
   ```rb
   bundle install
   ```
4. `.env.example` をコピーして `.env` を作成する
   ```sh
   cp .env.example .env
   ```
5. `.env` の内容を自分の環境用に書き換える
6. ローカル環境にデータベースとテーブルを作成する
   ```sh
   create database output;
   use output;

   # サンプル
   CREATE TABLE outputs (
     id bigint(20) NOT NULL AUTO_INCREMENT,
     body text NOT NULL
   ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
   ```
7. コピーした後に設定値を変更する
8. 実行して動作確認をする