require 'test_helper'

class GrowshopsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @growshop = growshops(:one)
  end

  test "should get index" do
    get growshops_url
    assert_response :success
  end

  test "should get new" do
    get new_growshop_url
    assert_response :success
  end

  test "should create growshop" do
    assert_difference('Growshop.count') do
      post growshops_url, params: { growshop: { description: @growshop.description, location: @growshop.location, name: @growshop.name } }
    end

    assert_redirected_to growshop_url(Growshop.last)
  end

  test "should show growshop" do
    get growshop_url(@growshop)
    assert_response :success
  end

  test "should get edit" do
    get edit_growshop_url(@growshop)
    assert_response :success
  end

  test "should update growshop" do
    patch growshop_url(@growshop), params: { growshop: { description: @growshop.description, location: @growshop.location, name: @growshop.name } }
    assert_redirected_to growshop_url(@growshop)
  end

  test "should destroy growshop" do
    assert_difference('Growshop.count', -1) do
      delete growshop_url(@growshop)
    end

    assert_redirected_to growshops_url
  end
end
