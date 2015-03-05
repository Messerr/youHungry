class UsersController < ApplicationController
	before_action :set_user, only: [:edit, :update, :show, :destroy]

   def like
      current_user.follow()
      redirect_to users_path
   end

   def unlike
      current_user.stop_following()
      redirect_to users_path
   end


  def index
  	@user = current_user
  	@users = User.all 
  	@search = params[:search]
    @client = Yelp::Client.new({ consumer_key: 'XNcYgteUH-DLeURnXTcp3Q',
	                  consumer_secret: 'zl4HAHLoHq3h2FKL6IZSM3qvhqU',
	                  token: 'hX0xp3x780IvbSGaix4tzEUDtRwha10T',
	                  token_secret: 'oWsYW3C4U2EEjLkb4-sjsax9d_Y'
             	   })

  end

  def show
    current_user
  end

  def edit
  	@user = current_user
  end

  def new
  	@user = User.new

  end

  def create
  	@user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.js
      else
        format.html { render :new }
        format.js { render json: @user.errors, status: :unprocessable_entity }
      end
    end

  end

  def like
    
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
