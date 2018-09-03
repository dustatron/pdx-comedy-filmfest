class AddArchiveToSubmissions < ActiveRecord::Migration[5.2]
  def change
    add_column :submissions, :archive, :boolean, default: false
    add_column :submissions, :status, :string, default: 'Being Reviewed'
    add_column :submissions, :month, :string, default: 'None'
    add_column :submissions, :reason, :string, default: 'None'
  end
end
