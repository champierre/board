class UsersController < ApplicationController
	def signup
		if request.post?
			if params[:password] == params[:password2]
				salt = Digest::MD5.hexdigest("#{params[:name]}")
				password = Digest::MD5.hexdigest("#{params[:password]}#{salt}")
				@user = User.create(name: "#{params[:name]}", password: password)

				render text: '<script>alert("アカウントを作りました。ログインしてください。");document.location = "/login";</script>'

			else
				render text: '<script>alert("確認パスワードが一致していません。");document.location = "/signup";</script>'
			end
		end	
	end
end
