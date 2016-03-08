class Api::V1::ApiItemsController < ApplicationController
  respond_to :json

  def all_items
    @items = Item.all
    respond_with @items
  end

  def show
    respond_with "item!"
  end

  def destroy
    respond_with "fire!"
  end

  def create
    respond_with "woo!"
  end

end