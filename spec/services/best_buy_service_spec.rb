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
        binding.pry
        expect(products.count).to eq(15)
      end
    end
  end
end
