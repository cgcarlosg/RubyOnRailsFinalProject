module UsersHelper
  def current_name
    current_user.username
  end
end
