class UsersController < ApplicationController
	before_action :set_user, only: [:edit, :update, :show, :destroy]


  def index
  	@users = User.all 
  end

  def show
  end

  def edit
  	@user = current_user
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  		if@user.save
  			session[:user_id] = @user.id
  				redirect_to @user, notice: "New user created."	
  	end
    #Needed to update users address based on there current ip when creating there account
    User.last.update(address: remote_ip)
  end

  def update
  		if @user.update(user_params)
  		redirect_to @user, notice: "User successfully updated."
  	end
  end

  def destroy
  	@user.destroy
  	redirect_to users_path, notice: "User was deleted."
  end

  private

  def set_user
  	@user = User.find(params[:id])
  end

  def user_params
  	params.require(:user).permit(:fname, :lname, :bio, :email, :password, :gender, :preference, :avatar)
  end

  def current_user
    session[:user_id] ? User.find(session[:user_id]) :nil
  end

end
