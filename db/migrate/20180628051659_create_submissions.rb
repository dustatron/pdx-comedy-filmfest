class CreateSubmissions < ActiveRecord::Migration[5.2]
  def change
    create_table :submissions do |t|
      t.string :title
      t.string :length
      t.string :link
      t.string :contact
      t.text   :description
      t.boolean :reuse, default: false

      t.timestamps
    end
  end
end
