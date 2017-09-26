Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'users'


  # TODO: remove before publication
	get '/' => 'application#fetch_all'

  scope '/users' do
    post '/new' => 'user#create'
  end
  
	scope '/listings' do
    # TODO: remove before publication
    get '/' => 'listing#index_listings'
		get '/:id' => 'listing#get_listing'
		post '/new' => 'listing#new_listing'
		put '/:id' => 'listing#edit_listing'
		delete '/:id' => 'listing#delete_listing'
	end

end
