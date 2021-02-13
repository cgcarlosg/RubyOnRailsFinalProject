require "test_helper"

class ShopingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shoping = shopings(:one)
  end

  test "should get index" do
    get shopings_url
    assert_response :success
  end

  test "should get new" do
    get new_shoping_url
    assert_response :success
  end

  test "should create shoping" do
    assert_difference('Shoping.count') do
      post shopings_url, params: { shoping: { category: @shoping.category, title: @shoping.title, total: @shoping.total, user_id: @shoping.user_id } }
    end

    assert_redirected_to shoping_url(Shoping.last)
  end

  test "should show shoping" do
    get shoping_url(@shoping)
    assert_response :success
  end

  test "should get edit" do
    get edit_shoping_url(@shoping)
    assert_response :success
  end

  test "should update shoping" do
    patch shoping_url(@shoping), params: { shoping: { category: @shoping.category, title: @shoping.title, total: @shoping.total, user_id: @shoping.user_id } }
    assert_redirected_to shoping_url(@shoping)
  end

  test "should destroy shoping" do
    assert_difference('Shoping.count', -1) do
      delete shoping_url(@shoping)
    end

    assert_redirected_to shopings_url
  end
end
