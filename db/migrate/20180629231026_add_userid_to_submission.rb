class AddUseridToSubmission < ActiveRecord::Migration[5.2]
  def change
    add_index :submissions, [:user_id, :created_at]
  end
end
