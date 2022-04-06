# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :commentable, polymorphic: true, null: false
      t.text :content, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
