require 'open-uri'

class BestBuyService
  attr_reader :connection

  def initialize
    @connection = Faraday.new(url: "http://api.bestbuy.com") do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.params[:apiKey] = ENV["BEST_BUY_KEY"]
      faraday.params[:format] = "json"
    end
  end

  def products(search)
    searches = search.split(" ").join("&search=")
    parse(connection.get("v1/products(search=#{searches})?show=sku,name,customerReviewAverage,shortDescription,salePrice,image&pageSize=15&page=1"))
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end
