class AddUserIdReports < ActiveRecord::Migration[6.1]
  def change
    add_column :reports, :user_id, :integer
  end
end
