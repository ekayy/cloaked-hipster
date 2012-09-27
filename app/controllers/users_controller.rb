
class UsersController < ApplicationController
  respond_to :json
  
  def edit
  	@user = current_user.profile
  end

  def update
		@user = User.find(params[:id])
    @dishes = @user.dishes    
    # @instagram = Instagram.media_search(User.find(params[:id]).profile.latitude, User.find(params[:id]).profile.longitude)
    @instagram = Instagram.media_search('32', '22')
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
    # @instagram = Instagram.media_search(@user.profile.latitude, @user.profile.longitude)
    @instagram = Instagram.media_search('32', '22')
	end

  def index
      @user = User.all
  end
end
