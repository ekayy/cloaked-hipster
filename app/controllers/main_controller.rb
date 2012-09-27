class MainController < ApplicationController
	before_filter :authenticate_user!
	
  def index
  	if :authenticate_user!
	  	@user = current_user
	  else
	  	users_path
	  end
  end
end
