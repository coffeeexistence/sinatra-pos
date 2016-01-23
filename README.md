# sinatra-pos




##The plan(according to stan)
	Create database structure
		Tables: () = has many, [] = belongs to
			users: username, password
			purchase_record: supply_or_resale, cost_per_each, quantity_bought, (items)
			item: name, description, quantity_available, [user_id, purchase_record_id, category_id]
			customers: first_name, last_name, phone, street, zip, email, notes, [user_id]
			vehicles: year, make, model, engine, VIN, EFN
			customer_sessions: [user_id, customer_id] (labor_records, sales_records, vehicles)
			sales_records: resale_price, description_override, quantity [customer_session_id, item_id]
			labor_records: labor_hours, hourly_rate, labor description, price_override [customer_session_id, item_id]
			invoices: discount_amount, notes, [user_id](labor_records, sales_records, customers, vehicles)

