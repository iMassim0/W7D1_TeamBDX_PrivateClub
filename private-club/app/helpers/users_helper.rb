module UsersHelper

  def owner(user)
    current_user
    if user == current_user
      return true
    else
      return false
    end
  end

end
