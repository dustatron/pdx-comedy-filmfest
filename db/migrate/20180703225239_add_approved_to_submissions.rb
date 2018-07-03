class AddApprovedToSubmissions < ActiveRecord::Migration[5.2]
  def change
    add_column :submissions, :approved, :boolean, default: false
  end
end
