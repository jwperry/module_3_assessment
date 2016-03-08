class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def index
    @items = Item.all
    binding.pry
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
