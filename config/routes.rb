Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'user', controllers: {
  	sessions: 'sessions',
  	passwords: 'passwords',
		registrations: 'registrations',
		omniauth_callbacks: 'omniauth_callbacks'  	
  }

  # TODO: remove before publication
	get '/' => 'application#fetch_all'

	scope '/listings' do
    # TODO: remove before publication
    get '/' => 'listing#index'
		get '/:id' => 'listing#get'
		post '/new' => 'listing#new'
		put '/:id' => 'listing#edit'
		delete '/:id' => 'listing#delete'
	end

	scope '/user' do
		get '/info/:id' => 'user#get'
	end
end
