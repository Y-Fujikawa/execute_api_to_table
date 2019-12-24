# frozen_string_literal: true

require "faraday"

class Api
  def initialize(url:, api_key:)
    @url = url
    @api_key = api_key
  end

  def find
    # 接続設定
    conn = Faraday.new(
        url: @url
    )

    resp = conn.get("sample")
    JSON.parse(resp.body)
  end
end