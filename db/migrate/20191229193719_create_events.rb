class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :eventdate
      t.string :deadline
      t.string :facebook
      t.string :ticket

      t.timestamps
    end
  end
end
