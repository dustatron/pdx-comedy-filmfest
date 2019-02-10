class AddWinningMonthToSubmissions < ActiveRecord::Migration[5.2]
  def change
    add_column :submissions, :winning_month, :string
    add_column :submissions, :winning_place, :string
    add_column :submissions, :best_of_month, :string
    add_column :submissions, :best_of_award, :string
  end
end
