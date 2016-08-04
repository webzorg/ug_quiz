require 'test_helper'

class Professor::HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get professor_home_index_url
    assert_response :success
  end

end
