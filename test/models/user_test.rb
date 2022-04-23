# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @alice = users(:alice)
    @bob = users(:bob)
  end

  test '#following?' do
    assert_not @alice.following?(@bob)
    @alice.follow(@bob)
    assert @alice.following?(@bob)
  end

  test '#followed_by?' do
    assert_not @alice.followed_by?(@bob)
    @bob.follow(@alice)
    assert @alice.followed_by?(@bob)
  end

  test '#follow' do
    assert_not @alice.following?(@bob)
    @alice.follow(@bob)
    assert @alice.following?(@bob)
  end

  test '#unfollow' do
    @alice.follow(@bob)
    assert @alice.following?(@bob)
    @alice.unfollow(@bob)
    assert_not @alice.following?(@bob)
  end

  test '#name_or_email' do
    assert_equal 'bob@example.com', @bob.name_or_email
    @bob.name = 'Bob'
    assert_equal 'Bob', @bob.name_or_email
  end
end
