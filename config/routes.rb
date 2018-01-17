Rails.application.routes.draw do
  get 'welcome/index'
  resources :articles do
  	resources :comments
  	# 成员路由
  	get 'preview', on: :member
  	get 'preview22222', on: :member
 #  	member do
	# 	get 'preview'
	# 	get 'preview2222'
	# end
	# 集合路由
	# collection do
 #    	get 'search'
 #    	get 'search2'
 #  	end
	get 'search', on: :collection
	get 'search2', on: :collection
  end
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
