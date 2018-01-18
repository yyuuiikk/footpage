require 'test_helper'

class ArticlePageTest < ActionDispatch::IntegrationTest

	# ページネーションテスト
	test "pagination should be" do
		get premier_path
		assert_template 'static_pages/premier'
		assert_select "div.pagination"
		Article.paginate(page: 1).each do |article|
			assert_select "a[href=?]", premier_path+"?page=2"
		end
	end

end
