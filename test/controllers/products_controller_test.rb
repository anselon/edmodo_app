require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: { avg_rating: @product.avg_rating, currency: @product.currency, edmodo_url: @product.edmodo_url, img_path: @product.img_path, long_desc_html: @product.long_desc_html, num_raters: @product.num_raters, owner_id: @product.owner_id, price: @product.price, seller_thumb_url: @product.seller_thumb_url, title: @product.title }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    patch :update, id: @product, product: { avg_rating: @product.avg_rating, currency: @product.currency, edmodo_url: @product.edmodo_url, img_path: @product.img_path, long_desc_html: @product.long_desc_html, num_raters: @product.num_raters, owner_id: @product.owner_id, price: @product.price, seller_thumb_url: @product.seller_thumb_url, title: @product.title }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
end
