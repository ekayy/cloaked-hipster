
class UsersController < ApplicationController
  respond_to :json
  before_filter :correct_user,   only: [:edit, :update]
  
  def edit
  	@user = User.find(params[:id])
  end

  def update
		@user = User.find(params[:id])
    @dishes = User.find(params[:id]).dishes    
    
		if @user.update_attributes(params[:user])
      @instagram = Instagram.media_search(@user.profile.latitude, @user.profile.longitude, { :distance => 10, :count => 4 })
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
      @instagram = Instagram.media_search(@user.profile.latitude, @user.profile.longitude, { :distance => 10, :count => 4 })
    end
	end

  def index
    # @users = User.text_search(params[:query])
    if params[:query_location].present?
      @users = Profile.near(params[:query_location], 15, :order => :distance).text_search(params[:query])
    else
      @users = Profile.text_search(params[:query])
    end
  end

  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless @user == current_user
    end
end
