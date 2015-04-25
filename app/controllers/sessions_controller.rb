class SessionsController < ApplicationController
	def login
		if request.post?
			salt = Digest::MD5.hexdigest("#{params[:name]}")
			password = Digest::MD5.hexdigest("#{params[:password]}#{salt}")

			@user = User.where(name: params[:name],password: password)
			byebug
		end
	end
end
