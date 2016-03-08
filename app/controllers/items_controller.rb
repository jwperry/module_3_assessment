class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id].to_i)
  end

  def search
    search = params["q"]
    @matching = BestBuyService.new.products(search)
  end
end
