module LoginMacros
  def login_as(user)
    session[:user_id] = user.id
  end

  def logout
    session.delete :user_id
  end
end
