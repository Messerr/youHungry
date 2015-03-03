class SessionsController < ApplicationController

	def create
		@user = User.find_by(email: params[:email])
		@user.update(address: remote_ip)
			if @user and @user.password == params[:password]
				flash[:notice] = "Successfully signed in!"
				session[:user_id] = @user.id
			else
				flash[:alert] = "Something went wrong"
			end
			redirect_to @user
	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = "Logged out"
		redirect_to root_path
	end
end
