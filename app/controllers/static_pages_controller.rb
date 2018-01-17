class StaticPagesController < ApplicationController
	def index
	end

	def premier
		@articles = Article.where(category: 0).paginate(page: params[:page], per_page: 9)
	end

	def liga
		@articles = Article.where(category: 1).paginate(page: params[:page], per_page: 9)
	end

	def bundes
		@articles = Article.where(category: 2).paginate(page: params[:page], per_page: 9)
	end

	def serie
		@articles = Article.where(category: 3).paginate(page: params[:page], per_page: 9)
	end
end
