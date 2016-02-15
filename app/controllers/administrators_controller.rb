class AdministratorsController < ApplicationController

	def manage_users
		setup_parameter("users")
	end

	def manage_admins
		setup_parameter("admins")
	end

	def join
		@user = User.find(params[:id])
		@user.update(administrator: true)
		redirect_to administrators_manage_users_path, notice: "User : #{@user.username} Has Successfully Joined to be an Administrator!"
	end

	def cancel
		@user = User.find(params[:id])
		@user.update(administrator: false)
		redirect_to administrators_manage_admins_path, alert: "User : #{@user.username} Has Changed back to Normal User!"
	end

	private

	def setup_parameter(type)
		if type == "users"
			@users = []
			User.all.each do |user|
				unless user.administrator
					@users << user
				end
			end 
		else
			@admins = []
			User.all.each do |user|
				if user.administrator
					@admins << user
				end
			end
		end
	end

end
