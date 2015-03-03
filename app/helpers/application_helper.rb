module ApplicationHelper
	def current_user
		session[:user_id] ? User.find(session[:user_id]) : nil
  end

  def set_user
    @user = User.find(params[:id])
  end
end
