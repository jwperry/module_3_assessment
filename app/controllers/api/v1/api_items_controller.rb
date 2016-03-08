class Api::V1::ApiItemsController < ApplicationController
  respond_to :json

  def all_items
    respond_with "all_items"
  end

  def show
    respond_with "item"
  end

  def destroy
    respond_with "fire!"
  end

end