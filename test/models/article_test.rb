require 'test_helper'

class ArticleTest < ActiveSupport::TestCase

	def setup
		@article = articles(:one)
	end

	test "should be valid" do
		assert @article.valid?
	end

	test "article should register" do
		assert @article.save
	end

	test "article should be unique" do
		duplicate_article = @article.dup
		@article.save
		assert_not duplicate_article.valid?
	end

end
