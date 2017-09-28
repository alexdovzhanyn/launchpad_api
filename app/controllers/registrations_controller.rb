class RegistrationsController < DeviseTokenAuth::RegistrationsController

  # Deletes the user identified by the given ID.
  # The ID has to be passed in the URL (/users/?id=42)
  # or in the body ({"id": 42}).
  # If no is given, the currently logged in user will be deleted.
  def destroy
    if params[:id]
      authorized = params[:id] == current_user&.id || current_user&.is_administrator
      render status: 401 and return unless authorized

      user = User.find_by_id(params[:id])
      render status: 404 and return unless user

      user.destroy
      render status: 200
    elsif current_user
      # no id given, but logged in
      current_user.destroy
      render status: 200
    else
      # not logged in and no id given
      render status: 400
    end
  end

end
