class CreateBuzzwords < ActiveRecord::Migration[5.1]
  def change
    create_table :buzzwords do |t|
      t.string :category
      t.string :word
      t.timestamps
    end
    add_index :buzzwords, [:category, :word], unique: true
  end
end
