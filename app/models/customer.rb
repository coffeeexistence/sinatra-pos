class PurchaseRecord < ActiveRecord::Base
	belongs_to :user
	belongs_to :item
end

class Vehicle < ActiveRecord::Base
	belongs_to :customer 
	has_many :customer_sessions
end

class Item < ActiveRecord::Base
	belongs_to :user
	has_many :purchase_records
end

class Customer < ActiveRecord::Base
	belongs_to :user
	has_many :vehicles
end

class CustomerSession < ActiveRecord::Base
	belongs_to :user
	belongs_to :customer
	belongs_to :vehicle
	belongs_to :invoice
	has_many :sales_records
	has_many :labor_records
end

class SalesRecord < ActiveRecord::Base
	belongs_to :item
	belongs_to :customer_session
end

class LaborRecord < ActiveRecord::Base
	belongs_to :customer_session
end

class Invoice < ActiveRecord::Base
	belongs_to :user
	belongs_to :customer_session
end

