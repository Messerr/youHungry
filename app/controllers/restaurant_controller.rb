class RestaurantController < ApplicationController

  def create
  	Restaurant.create(name:(params[:id]))
  end

	def like
		@restaurant = Restaurant.new
		@response = @client.search_by_coordinates({ latitude: current_user.latitude, longitude: current_user.longitude }, { term: 'food', category_filter: params[:search] })
		@restaurant.name = @response.businesses.id
		if @restaurant.save 
			current_user.follow(@restaurant)
		else
			current_user.follow(@restaurant)
		end

	end

	def unlike

	end

	def show

	end

	private

		def current_user
			session[:user_id] ? User.find(session[:user_id]) :nil
		end
	
end
