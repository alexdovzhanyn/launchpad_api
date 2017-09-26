class UserController < ApplicationController

  def create
		mail = params[:email]

		if User.exists?(email: mail)
      render status: 409 and return
		end

    user = User.create(
			email: mail,
			first_name: params[:first_name],
			last_name: params[:last_name],
			password: params[:password],
			password_confirmation: params[:password_confirmation]
		)

		render json: user.to_json
  end
end
