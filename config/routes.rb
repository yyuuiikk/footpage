Rails.application.routes.draw do
	root 'static_pages#index'
	get 	'/premier',		to: 'static_pages#premier'
	get 	'/bundes',		to: 'static_pages#bundes'
	get 	'/liga',		to: 'static_pages#liga'
	get 	'/serie',		to: 'static_pages#serie'
end
