# frozen_string_literal: true

class Users::FollowingsController < ApplicationController
  before_action :set_user

  def index
    @users = @user.followings.with_attached_avatar.order(:id).page(params[:page])
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
