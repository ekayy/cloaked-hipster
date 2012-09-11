class DishesController < ApplicationController
	respond_to :json

  def index
    respond_with Dish.all
    # if signed_in?
    #   respond_with current_user.task_feed
    # end
  end

  def show
    respond_with current_user.dishes.find(params[:id])
  end

  def create
    respond_with current_user.dishes.create(params[:dish])
  end

  def update
    respond_with current_user.dishes.update(params[:id], params[:dish])
  end

  def destroy
    respond_with current_user.dishes.destroy(params[:id])
  end
end

