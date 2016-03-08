require 'rails_helper'

describe "BestBuyService" do

  before do
    @best_buy_service = BestBuyService.new
  end

  context "#products" do
    it "finds products matching search" do
      VCR.use_cassette("best_buy_service#products") do
        products_json = @best_buy_service.products("sennheiser")
        products = products_json[:products]
        expect(products.count).to eq(15)
        expect(products.first[:sku]).to eq(4763330)
        expect(products.first[:name]).to eq("Galaxy Audio - Headset Microphone - Beige")
        expect(products.first[:customerReviewAverage]).to eq(nil)
        expect(products.first[:shortDescription][0..10]).to eq("GALAXY AUDI")
        expect(products.first[:salePrice]).to eq(199.99)
        expect(products.first[:image]).to eq("http://images.bestbuy.com/BestBuy_US/images/products/4763/4763330_sa.jpg")
      end
    end
  end
end
