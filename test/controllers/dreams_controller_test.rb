require 'test_helper'

class DreamsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dreams_index_url
    assert_response :success
  end

end
