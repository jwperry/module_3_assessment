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
    respond_with "fire!"
  end

  def create
    respond_with "woo!"
  end

end
