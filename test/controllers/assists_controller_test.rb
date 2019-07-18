require 'test_helper'

class AssistsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get assists_index_url
    assert_response :success
  end

end
