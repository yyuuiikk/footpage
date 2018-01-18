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

	# ヘッダーリンクの表示テスト
	test "header link should not be valid" do
		get root_path
		assert_select ".dropdown-menu a[href=?]", premier_path, count: 0
		assert_select ".dropdown-menu a[href=?]", bundes_path, count: 0
		assert_select ".dropdown-menu a[href=?]", liga_path, count: 0
		assert_select ".dropdown-menu a[href=?]", serie_path, count: 0
	end

	test "header link should be valid -premier-" do
		get premier_path
		assert_select ".dropdown-menu a[href=?]", premier_path
		assert_select ".dropdown-menu a[href=?]", bundes_path
		assert_select ".dropdown-menu a[href=?]", liga_path
		assert_select ".dropdown-menu a[href=?]", serie_path
	end

	test "header link should be valid -bundes-" do
		get bundes_path
		assert_select ".dropdown-menu a[href=?]", premier_path
		assert_select ".dropdown-menu a[href=?]", bundes_path
		assert_select ".dropdown-menu a[href=?]", liga_path
		assert_select ".dropdown-menu a[href=?]", serie_path
	end

	test "header link should be valid -liga-" do
		get liga_path
		assert_select ".dropdown-menu a[href=?]", premier_path
		assert_select ".dropdown-menu a[href=?]", bundes_path
		assert_select ".dropdown-menu a[href=?]", liga_path
		assert_select ".dropdown-menu a[href=?]", serie_path
	end

	test "header link should be valid -serie-" do
		get serie_path
		assert_select ".dropdown-menu a[href=?]", premier_path
		assert_select ".dropdown-menu a[href=?]", bundes_path
		assert_select ".dropdown-menu a[href=?]", liga_path
		assert_select ".dropdown-menu a[href=?]", serie_path
	end
end
