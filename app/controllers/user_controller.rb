class UserController < ApplicationController

	def create
		render status: 409 and return if User.exists?(email: params[:email])

		user = User.create(
			email: params[:email], 
			first_name: params[:first_name],
			last_name: params[:last_name],
			password: params[:password], 
			password_confirmation: params[:password_confirmation]
		)

		render json: user.to_json
	end

end