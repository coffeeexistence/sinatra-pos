class User < ActiveRecord::Base
	has_many :customers
	has_many :customer_sessions
	has_many :invoices
	has_many :purchase_records
	has_many :items

	def slug
		self.username.gsub(" ", "-").downcase
	end

	def self.find_by_slug(slug_name)
		self.all.find{|instance| instance.slug==slug_name}
	end
end