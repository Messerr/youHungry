module MessagesHelper
		 def recipients_options
    		s = ''
    		User.all.each do |user|
     		s << "<option value='#{user.id} #{user.fname}</option>"
   		 end
   			 s.html_safe
  		 end

end

