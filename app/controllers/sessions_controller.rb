class SessionsController < ApplicationController
	def login
		if request.post?
			@users = User.where("name = #{params[:name]}")

		end	
	end

end
