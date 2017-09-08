class AddTypeIdToItem < ActiveRecord::Migration[5.1]
  def change
  	add_reference :items, :type, index: true
    add_foreign_key :items, :types
  end
end
