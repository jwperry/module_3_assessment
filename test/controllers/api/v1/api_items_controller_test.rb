require_relative '../test_helper'

class Api::V1::ItemsControllerTest < ActionDispatch::IntegrationTest

  test '#all_items' do
    get :all_items, format: :json
    response = JSON.parse(response.body)
    binding.pry
  end

end
