class InventoryController < ApplicationController
	get '/inventory' do  
		redirect_if_not_authorized!
		@user=Helpers.current_user(session)
		erb :'inventory/inventory_index'
	end

	post '/inventory' do  
		redirect_if_not_authorized!
		@user=Helpers.current_user(session)
		add_inventory_items(params)
		redirect '/inventory'
	end

	get '/inventory/add' do  
		redirect_if_not_authorized!
		@user=Helpers.current_user(session)
		erb :'/inventory/inventory_add'
	end

	

	############HELPER FUNCTIONS############
	def add_inventory_items(params)
		result_Qty=params[:quantity].to_i
		cost=params[:cost]
		name=params[:name].strip.downcase

		search = Item.find_by(name: name)
		if search
			search.quantity_available=search.quantity_available.to_i+result_Qty
			new_purchase=PurchaseRecord.create()
			new_purchase.item=search
			new_purchase.cost_per_each=cost
			new_purchase.quantity_bought=result_Qty
			new_purchase.user=@user
			search.save
			new_purchase.save
		else
			new_item=Item.create(name: name, quantity_available: result_Qty, user_id: @user.id)
			new_purchase=PurchaseRecord.create()
			new_purchase.item=new_item
			new_purchase.cost_per_each=cost
			new_purchase.quantity_bought=result_Qty
			new_purchase.user=@user
			new_purchase.save
		end
	end

end