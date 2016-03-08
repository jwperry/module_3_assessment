class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def index
    @items = Item.all
    respond_with @items
  end

  def show
    @item = Item.find(params[:id])
    respond_with @item
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      respond_with 204
    else
      respond_with 500
    end
  end

  def create
    @item = Item.create(name: params["name"],
                        description: params["description"],
                        image_url: params["image_url"])
    respond_with(@item, status: 201)
  end
end
