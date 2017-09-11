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
		puts '***************'
		puts item_params
		if @item.valid?
			@item.save
			redirect_to @item
		else
			flash[:notice] = @item.errors.full_messages.join(', ') 
			redirect_to new_item_path
		end
	end

	def edit
	end

	def update
		if @item.update(item_params)
			redirect_to @item
		else
			alert('error')
		end
	end

	private

	def item_params
		params.require(:item).permit(:name, :size, :price,:brand_id,:color_id,:type_id)
	end
end
