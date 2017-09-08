class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
    	t.string :name
    	t.string :size
    	t.integer :price
    	t.string :src
    	t.belongs_to :color, foreign_key: true, index: true
    	t.belongs_to :brand, foreign_key: true, index: true
      t.timestamps
    end
  end
end
