class AddPasswordToSubmissions < ActiveRecord::Migration[5.2]
  def change
    add_column :submissions, :password, :string
  end
end
