class UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(3).reverse_order
  end

  def show
    # @user = current_user
    @user = User.find(params[:id])
  end
end
