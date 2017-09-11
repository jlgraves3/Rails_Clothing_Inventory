class ItemsController < ApplicationController
	def index
		@items = Item.all
	end

	def show
		@item = Item.find(params[:id])
	end

	def new
		@item = Item.new
		@colors = Color.all
		@types = Type.all
		@brands = Brand.all
	end

	def create
		@item = Item.new(item_params)
		if @item.valid?
			@item.save
			redirect_to @item
		else
			flash[:notice] = @item.errors.full_messages.join(', ') 
			redirect_to new_item_path
		end
	end

	def edit
		@item = Item.find(params[:id])		
		@colors = Color.all
		@types = Type.all
		@brands = Brand.all
	end

	def update
		if @item.update(item_params)
			redirect_to @item
		else
			flash[:notice] = @item.errors.full_messages.join(', ') 
			redirect_to edit_item_path
		end
	end

	private

	def item_params
		params.require(:item).permit(:name, :brand_id,:color_id,:type_id)
	end
end
