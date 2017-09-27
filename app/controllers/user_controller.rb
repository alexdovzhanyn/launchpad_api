class UserController < ApplicationController
	before_action :authenticate_user!

	# This is useful for things like viewing another user's profile
	def get
		user = User.find_by_id(params[:id])

		if user
      render json: user.attributes.extract!('email', 'first_name', 'last_name', 'created_at').to_json
    else
      render status: 204
    end
	end

end
