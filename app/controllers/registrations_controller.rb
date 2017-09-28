class RegistrationsController < DeviseTokenAuth::RegistrationsController

  # Deletes the user identified by the given ID.
  # The ID has to be passed in the URL (/users/?id=42)
  # or in the body ({"id": 42})
  def destroy
    render status: 400 and return unless params[:id]

    authorized = params[:id] == current_user&.id || current_user&.is_administrator
    render status: 401 and return unless authorized

    user = User.find_by_id(params[:id])
    render status: 404 and return unless user

    user.destroy
    render status: 200
  end
end
