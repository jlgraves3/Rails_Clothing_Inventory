class AddTypeIdToItem < ActiveRecord::Migration[5.1]
  def change
  	add_foreign_key :items, :types
  end
end
