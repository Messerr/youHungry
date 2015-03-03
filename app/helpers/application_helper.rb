module ApplicationHelper
	def current_user
		session[:user_id] ? User.find(session[:user_id]) : nil
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
  	params.require(:user).permit(:fname, :lname, :bio, :email, :password, :gender, :preference, :avatar)
  end

end
