require 'test_helper'

class AiProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ai_products_index_url
    assert_response :success
  end

  test "should get show" do
    get ai_products_show_url
    assert_response :success
  end

end
