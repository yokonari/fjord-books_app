# frozen_string_literal: true

class ChengeColumnsAddNotnullOnFriendships < ActiveRecord::Migration[6.1]
  def change
    change_column_null :friendships, :follower_id, false
    change_column_null :friendships, :following_id, false
  end
end
