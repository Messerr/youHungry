class RestaurantsController < ApplicationController

  def create
    @user = current_user
    @restaurant = Restaurant.new
    @restaurant.name = params[:name]
     if @restaurant.save
        @user.follow(@restaurant)
     else
       flash[:notice] = @restaurant.errors.full_messages
     end
    redirect_to users_path
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name)
  end
end
