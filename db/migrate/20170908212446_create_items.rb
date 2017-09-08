class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
    	t.string :name
    	t.string :brand
    	t.string :type
    	t.string :size
    	t.integer :price
    	t.string :color
    	t.sting :src
      t.timestamps
    end
  end
end
