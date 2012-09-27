
class UsersController < ApplicationController

  before_filter :authenticate_user!
  respond_to :json
  
  def edit
  	@user = current_user.profile
  end

  def update
		@user = User.find(params[:id])
    @dishes = @user.dishes    
		@profile = current_user.profile
		if @profile.update_attributes(params[:profile])
      render 'show'
    else
      render 'edit'
    end
	end

	def show
    @user = User.find(params[:id])
    @dishes = @user.dishes  	
    # @instagram = Instagram.media_search("37", "-122")
      # @instagram = Instagram.media_popular
    # respond_with current_user.profile.find(params[:id])
	end

  def index
    @user = User.all
  end
end
