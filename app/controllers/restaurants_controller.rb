class RestaurantsController < ApplicationController

  def create
    @user = current_user
    @restaurant = Restaurant.new
    @restaurant.name = params[:name]
     if @restaurant.save
        @user.follow(@restaurant)
        flash[:notice] = "Restaurant Liked!"
     else
       flash[:notice] = @restaurant.errors.full_messages
     end
    redirect_to users_path
  end

  def update
    @user = current_user
    @restaurant = Restaurant.find(params[:id])
    @user.stop_following(@restaurant)
    flash[:notice] = "Restaurant Unliked!"
    redirect_to users_path
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name)
  end
end
