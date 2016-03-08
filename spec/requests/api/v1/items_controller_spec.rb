require "rails_helper"

describe "items" do
  describe "GET index" do
    it "returns all items" do
      
      get "/api/v1/items"
      items_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      binding.pry
    end
  end
end
