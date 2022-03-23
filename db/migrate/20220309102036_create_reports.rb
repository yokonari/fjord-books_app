# frozen_string_literal: true

class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.references :report, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
