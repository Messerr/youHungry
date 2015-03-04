class User < ActiveRecord::Base
	acts_as_follower
	
	geocoded_by :address
	after_validation :geocode

	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  	acts_as_messageable


  def mailboxer_email(current_user)
 	  return :mailboxer_email
	end
end
