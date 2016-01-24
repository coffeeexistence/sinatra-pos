class CreateUserSessionTables < ActiveRecord::Migration
  def change
  	create_table :vehicles do |t|
  		t.string :year
  		t.string :make
  		t.string :model
  		t.string :engine
  		t.string :EFN
  		t.string :VIN
      t.integer :customer_id
  		t.integer :customer_session_id
  	end

  	create_table :customer_sessions do |t|
  		t.integer :user_id
  		t.integer :customer_id
  		t.integer :vehicle_id
  	end

  	create_table :sales_records do |t|
  		t.string :description_override
  		t.integer :resale_price
  		t.integer :quantity
  		t.integer :item_id
  		t.integer :customer_session_id
  	end

  	create_table :labor_records do |t|
  		t.string :labor_description
  		t.integer :labor_hours
  		t.integer :hourly_rate
  		t.integer :price_override
  		t.integer :customer_session_id
  	end

  	create_table :invoices do |t|
  		t.integer :discount_amount
  		t.string :notes
  		t.integer :user_id
  		t.integer :customer_session_id
  	end

  end
end
