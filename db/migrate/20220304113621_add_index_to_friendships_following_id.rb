# frozen_string_literal: true

class AddIndexToFriendshipsFollowingId < ActiveRecord::Migration[6.1]
  def change
    add_index :friendships, :following_id
    add_index :friendships, %i[follower_id following_id], unique: true
  end
end
