class RegistrationsController < ApplicationController
	def new
	end

	def create
		#complete this method
		user = User.create(
			name: params[:registrations][:name],
			last_name: params[:registrations][:last_name],
			email: params[:registrations][:email],
			password: params[:registrations][:password],
			phone: params[:registrations][:phone],
		)
		if user.save
			flash[:notice] = "SUCCESS!"
			redirect_to root_url
		else
			flash[:notice] = "Error, registration failed!"
			redirect_to registrations_url
		end
	end
end
