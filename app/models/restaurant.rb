class Restaurant < ActiveRecord::Base
	acts_as_followable
	validates_uniqueness_of :name
end
