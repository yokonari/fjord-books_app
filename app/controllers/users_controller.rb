# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def followings
    @user  = User.find(params[:id])
    @users = @user.followings.page(params[:page])
    render 'followings'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers.page(params[:page])
    render 'followers'
  end
end
