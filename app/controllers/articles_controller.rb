class ArticlesController < ApplicationController
	def index
		@articles = Article.paginate(page: params[:page], per_page: 9)
	end
end
