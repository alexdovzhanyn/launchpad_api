class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

	def fetch_all
		return_value = {
			users: User.all,
			listings: Listing.all
		}
		render json: return_value.to_json
	end

end
