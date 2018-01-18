require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

	test "get index page" do
		get root_path
		assert_response :success
	end

end
