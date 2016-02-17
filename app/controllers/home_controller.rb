class HomeController < ApplicationController
  def index
  	# The first user is always the admin
  	if current_user == User.first
  		User.first.update(administrator: true)
  	end
  end
end
