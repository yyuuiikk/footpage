Rails.application.routes.draw do
	root 'static_pages#index'
	get 	'/premier',		to: 'articles#index'
end
