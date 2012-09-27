
class UsersController < ApplicationController
  respond_to :json
  
  def edit
  	@user = current_user.profile
    # @instagram = Instagram.media_search(User.find(params[:id]).profile.latitude, User.find(params[:id]).profile.longitude)
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
    @instagram = Instagram.media_search(@user.profile.latitude, @user.profile.longitude)
    # respond_with current_user.profile.find(params[:id])
	end

  def index
    @user = User.all
  end
end
