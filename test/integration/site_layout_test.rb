require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

	# リンクのテスト
	test "layout links" do
		get root_path
		assert_template 'static_pages/index'
		assert_select "a[href=?]", root_path
		assert_select "a[href=?]", premier_path
		assert_select "a[href=?]", bundes_path
		assert_select "a[href=?]", liga_path
		assert_select "a[href=?]", serie_path
	end

end
