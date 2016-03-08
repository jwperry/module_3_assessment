require "rails_helper"

describe "items" do
  describe "GET index" do
    it "returns all items" do
      item = Item.create(name: "TestItem",
                         description: "TestDescription",
                         image_url: "ImageURL")
      get "/api/v1/items"
      items_json = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(items_json.first["name"]).to eq(item.name)
      expect(items_json.first["description"]).to eq(item.description)
      expect(items_json.first["image_url"]).to eq(item.image_url)
      expect(items_json.count).to eq(1)
    end
  end

  describe "GET show" do
    it "returns the specified item" do
      item1 = Item.create(name: "TestItem1",
                         description: "TestDescription1",
                         image_url: "ImageURL1")
      item2 = Item.create(name: "TestItem2",
                         description: "TestDescription2",
                         image_url: "ImageURL2")
      get "/api/v1/items/2"
      item_json = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(item_json["name"]).to eq(item2.name)
      expect(item_json["description"]).to eq(item2.description)
      expect(item_json["image_url"]).to eq(item2.image_url)
    end
  end

  describe "DELETE destroy" do
    it "deletes the item" do
      item1 = Item.create(name: "TestItem1",
                         description: "TestDescription1",
                         image_url: "ImageURL1")
      item2 = Item.create(name: "TestItem2",
                         description: "TestDescription2",
                         image_url: "ImageURL2")
      expect(Item.count).to eq(2)
      delete "/api/v1/items/1"
      expect(Item.count).to eq(1)
      expect(response.status).to eq(204)
    end
  end

  describe "POST create" do
    it "creates an item" do
      params = { name: "TestItem",
                 description: "TestDescription",
                 image_url: "ImageURL",
                 format: :json }
      expect(Item.count).to eq(0)
      post "/api/v1/items", params
      item_json = JSON.parse(response.body)
      expect(response.status).to eq(201)
      expect(item_json["name"]).to eq(params[:name])
      expect(item_json["description"]).to eq(params[:description])
      expect(item_json["image_url"]).to eq(params[:image_url])
      expect(Item.count).to eq(1)
    end
  end
end
