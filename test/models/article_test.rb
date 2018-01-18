require 'test_helper'

class ArticleTest < ActiveSupport::TestCase

	def setup
		@article = Article.new(date: "2018-01-18", thumnail: "http://img.com", title: "テストタイトル", link: "http://example.com/link", site_name: "テストサイト", site_top: "http://testsite.com/", category: 0)
	end

	test "should be valid" do
		assert @article.valid?
	end

end
