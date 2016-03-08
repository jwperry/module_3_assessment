require 'open-uri'

class BestBuyService
  attr_reader :connection

  def initialize
    @connection = Faraday.new(url: "http://api.bestbuy.com") do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.params[:apiKey] = ENV["BEST_BUY_KEY"]
    end
  end

  def products(search)
    parse(connection.get("v1/products?format=json&show=id"))
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end
