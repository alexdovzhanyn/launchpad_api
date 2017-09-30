class RegistrationsController < DeviseTokenAuth::RegistrationsController
  before_action :authenticate_user!, only: [:destroy]

  # Deletes the user identified by the given ID.
  # The ID has to be passed in the URL (/users/?id=42)
  # or in the body ({"id": 42}).
  # If no is given, the currently logged in user will be deleted.
  def destroy
    user = params[:id] ? User.find_by_id(params[:id]) : current_user
    render status: :not_found and return unless user

    authorized = user.id == current_user.id || current_user.administrator?
    render status: :unauthorized and return unless authorized

    user.destroy
    render status: :ok
  end
end
