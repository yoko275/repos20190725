require 'test_helper'

class DictsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dict = dicts(:one)
  end

  test "should get index" do
    get dicts_url
    assert_response :success
  end

  test "should get new" do
    get new_dict_url
    assert_response :success
  end

  test "should create dict" do
    assert_difference('Dict.count') do
      post dicts_url, params: { dict: { eword: @dict.eword, jkana: @dict.jkana, jword: @dict.jword } }
    end

    assert_redirected_to dict_url(Dict.last)
  end

  test "should show dict" do
    get dict_url(@dict)
    assert_response :success
  end

  test "should get edit" do
    get edit_dict_url(@dict)
    assert_response :success
  end

  test "should update dict" do
    patch dict_url(@dict), params: { dict: { eword: @dict.eword, jkana: @dict.jkana, jword: @dict.jword } }
    assert_redirected_to dict_url(@dict)
  end

  test "should destroy dict" do
    assert_difference('Dict.count', -1) do
      delete dict_url(@dict)
    end

    assert_redirected_to dicts_url
  end
end
