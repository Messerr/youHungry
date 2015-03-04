module ApplicationHelper
	def current_user
		session[:user_id] ? User.find(session[:user_id]) : nil
	end

  client = Yelp::Client.new({ consumer_key: 'XNcYgteUH-DLeURnXTcp3Q',
                          consumer_secret: 'zl4HAHLoHq3h2FKL6IZSM3qvhqU',
                          token: 'hX0xp3x780IvbSGaix4tzEUDtRwha10T',
                          token_secret: 'oWsYW3C4U2EEjLkb4-sjsax9d_Y'
                        })
end
