class WelcomeController < ApplicationController

  def index
    respond_to do |format|
        format.html {
          if current_user
            redirect_to users_path
          end
        }
        format.js
    end
  end

  def new
  end


  def edit

  end

  def show
  end

end
