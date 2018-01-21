require 'test_helper'

class LegopinsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get legopins_index_url
    assert_response :success
  end

end
