
class UsersController < ApplicationController
  respond_to :json
  
  def edit
  	@user = User.find(params[:id])
  end

  def update
		@user = User.find(params[:id])
    @dishes = User.find(params[:id]).dishes    
    
		if @user.update_attributes(params[:user])
      @instagram = Instagram.media_search(@user.profile.latitude, @user.profile.longitude, { :distance => 10, :count => 5 })
      render 'show'
    else
      flash.now[:error] = 'Invalid information'
      render 'edit'
    end
	end

	def show
    @user = User.find(params[:id])
    @dishes = @user.dishes  
    if @user.profile.latitude.nil?
      @instagram	= Instagram.media_search(20, 32)
    else
      @instagram = Instagram.media_search(@user.profile.latitude, @user.profile.longitude, { :distance => 10, :count => 5 })
    end
	end

  def index
    # @users = User.all
    @users = User.text_search(params[:query])
  end
end
