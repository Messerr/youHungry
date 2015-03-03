class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
  	session[:user_id] ? User.find(session[:user_id]) :nil
  end

  require 'yelp'

  #Should hide api key
  client = Yelp::Client.new({ consumer_key: 'XNcYgteUH-DLeURnXTcp3Q',
                              consumer_secret: 'zl4HAHLoHq3h2FKL6IZSM3qvhqU',
                              token: 'hX0xp3x780IvbSGaix4tzEUDtRwha10T',
                              token_secret: 'oWsYW3C4U2EEjLkb4-sjsax9d_Y'
                            })

  def remote_ip
    if request.remote_ip == '::1'
      # Hard coded remote address
      '108.30.115.85'
    else
      request.remote_ip
    end

  end

end
