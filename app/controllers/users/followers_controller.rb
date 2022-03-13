# frozen_string_literal: true

class Users::FollowersController < ApplicationController
  before_action :set_user

  def index
    @users = @user.followers.with_attached_avatar.order(:id).page(params[:page])
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
