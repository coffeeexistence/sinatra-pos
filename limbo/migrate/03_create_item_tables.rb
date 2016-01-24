class CreateItemTables < ActiveRecord::Migration
  def change
  	create_table :purchase_records do |t|
  		t.string :supply_or_resale
  		t.integer :cost_per_each
  		t.integer :quantity_bought
  		t.integer :total_cost
      t.integer :item_id
  	end

  	create_table :items do |t|
  		t.string :name
  		t.string :description
  		t.integer :quantity_available
  		t.integer :user_id
  		t.integer :category_id
  	end
  end
end
