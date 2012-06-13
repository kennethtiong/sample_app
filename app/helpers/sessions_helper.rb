module SessionsHelper

  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

		#  In other words, the code

		# self.current_user = ...
		# is automatically converted to

		# current_user=(...)

  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  def sign_out
    self.current_user = nil
    # isn't strictly necessary sicne destroy will take care of it
    cookies.delete(:remember_token)
    # delete is an already defined method
  end
end