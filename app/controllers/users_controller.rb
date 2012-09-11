class UsersController < ApplicationController
  def edit
  	@user = current_user.profile
  end

  def update
		@user = User.find(params[:id])
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
	end
end
