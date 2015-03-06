class RestaurantsController < ApplicationController

  def create
    @user = current_user
    @restaurant = Restaurant.new
    @restaurant.name = params[:name]
     if @restaurant.save
        @user.follow(@restaurant)
        flash[:notice] = "Restaurant Liked!"
     else
       flash[:notice] = "Already Liked Restaurant!"
     end
    redirect_to users_path
  end

  def update
    @user = current_user
    @restaurant = params[:name]
    @user.stop_following(Restaurant.where(name: @restaurant).first)
    flash[:notice] = "Restaurant Unliked!"
    redirect_to users_path
  end

  def show
    @restaurant = params[:name]
  end


  private
  def restaurant_params
    params.require(:restaurant).permit(:name)
  end

end



