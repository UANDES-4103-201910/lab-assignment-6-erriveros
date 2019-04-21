class SessionsController < ApplicationController
	def new
	end

	def create
		#complete this method
		user = User.where(email: params[:session][:email], password: params[:session][:password])[0]
		if user
			cookies[:curr_user] = user
			flash[:notice] = "SUCCESS!"
			redirect_to "/users/" + String(user.id)
		else
			flash[:notice] = "Invalid user"
			redirect_to root_url
		end
	end

	def destroy
		#complete this method
		cookies[:curr_user] = nil
		redirect_to root_url
	end
end
