class StaticPagesController < ApplicationController
	def index
	end

	def premier
		@articles = Article.where(category: 0)
	end

	def bundes
		@articles = Article.where(category: 1)
	end

	def liga
		@articles = Article.where(category: 2)
	end

	def serie
		@articles = Article.where(category: 3)
	end
end
