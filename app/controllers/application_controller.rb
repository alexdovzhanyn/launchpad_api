class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :set_raven_context

	 def fetch_all
 		return_value = {
 			users: User.all,
 			listings: Listing.all
 		}

 		render json: return_value.to_json
 	end

	private

  def set_raven_context
    Raven.user_context(id: current_user ? current_user.id : 'Not signed in')
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end
end
