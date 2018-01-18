require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

	def setup
		@base_title = "FootBall広場"
	end

	test "get index page" do
		get root_path
		assert_response :success
		assert_select "title", @base_title
	end

	test "get premier page" do
		get premier_path
		assert_response :success
		assert_select "title", "プレミアリーグ | #{@base_title}"
	end

	test "get bundes page" do
		get bundes_path
		assert_response :success
		assert_select "title", "ブンデスリーガ | #{@base_title}"
	end

	test "get liga page" do
		get liga_path
		assert_response :success
		assert_select "title", "リーガ・エスパニョーラ | #{@base_title}"
	end

	test "get serie page" do
		get serie_path
		assert_response :success
		assert_select "title", "セリエA | #{@base_title}"
	end

end
