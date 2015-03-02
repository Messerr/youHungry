class UsersController < ApplicationController
  def index

  end

  def show

  end

  def edit

  end

  def new
  	
  end

  def create

  	#Needed to update users address based on there current ip when creating there account
  	User.last.update(address: remote_ip)
  end
end
