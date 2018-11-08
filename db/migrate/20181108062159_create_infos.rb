class CreateInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :infos do |t|
      t.string :page
      t.text :body

      t.timestamps
    end
  end
end
