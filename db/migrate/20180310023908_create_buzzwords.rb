class CreateBuzzwords < ActiveRecord::Migration[5.1]
  def change
    create_table :buzzwords do |t|
      t.string :category
      t.text :buzzwords

      t.timestamps
    end
  end
end
