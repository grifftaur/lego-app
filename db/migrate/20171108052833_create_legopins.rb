class CreateLegopins < ActiveRecord::Migration[5.1]
  def change
    create_table :legopins do |t|
      t.string :name
      t.string :year
      t.integer :setnumber
      t.text :url
      t.timestamps null: false
    end
  end
end
