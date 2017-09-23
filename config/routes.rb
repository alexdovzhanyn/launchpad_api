Rails.application.routes.draw do

	# fetch all records (just for ease of dev, we'll remove this later)
	get '/' => 'application#fetch_all'
  
	scope '/listings' do
		get '/:id' => 'listing#get_listing'
		post '/new' => 'listing#new_listing'
		put '/:id' => 'listing#edit_listing'
		delete '/:id' => 'listing#delete_listing'
	end

end
