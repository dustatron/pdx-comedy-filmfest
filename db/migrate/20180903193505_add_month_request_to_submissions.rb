class AddMonthRequestToSubmissions < ActiveRecord::Migration[5.2]
  def change
    add_column :submissions, :preferred_month, :string, default: 'None'
    add_column :submissions, :has_rights, :boolean, default: false
  end
end