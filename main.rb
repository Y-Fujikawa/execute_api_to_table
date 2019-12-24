# frozen_string_literal: true

require "date"
require "dotenv"
require "erb"
require "active_record"
require "./api"

class Output < ActiveRecord::Base
end

Dotenv.load

if !File.exist?(".env")
  p ".envファイルを作成してください"
  exit
end

config = YAML.load(ERB.new(File.read("./config/database.yml") ).result)
# 環境を切り替える
ActiveRecord::Base.establish_connection(config["development"])

p "データ抽出を開始します。"
num = 0
while num < 100 do
  p "#{num + 1}回目を実行します。"
  api = Api.new(url: ENV["API_URL"], api_key: ENV["API_KEY"])
  body = api.find

  body.each do |b|

    Output.create!(
        body: b["body"]
    )
  end
  num += 1
  sleep(2)
  p "#{num}回目が終了しました。"
end
p "データ抽出が終了しました。"
