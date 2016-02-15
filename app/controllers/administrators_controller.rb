class AdministratorsController < ApplicationController

	def manage_users
		setup_parameter("users")
	end

	def manage_admins
		setup_parameter("admins")
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
