class SessionsController < ApplicationController

	def create
		@user = User.find_by(email: params[:email])

			if @user and @user.password == params[:password]
        @user.update(address: remote_ip)
				flash[:notice] = "Successfully signed in!"
				session[:user_id] = @user.id
        redirect_to users_path
			elsif @user and @user.password == nil
				flash[:alert] = "Email or Password cannot be blank!"
        redirect_to '/#thirdPage'
      else
        flash[:alert] = "Something went wrong!"
        redirect_to '/#thirdPage'
			end

	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = "Logged out"
		redirect_to root_path
	end
end
