class User < ActiveRecord::Base
	has_many :customers, :customer_sessions, :invoices, :items, :purchase_records

	def slug
		self.username.gsub(" ", "-").downcase
	end

	def self.find_by_slug(slug_name)
		self.all.find{|instance| instance.slug==slug_name}
	end
end