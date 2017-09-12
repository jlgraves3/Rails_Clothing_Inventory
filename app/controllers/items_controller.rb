class ItemsController < ApplicationController
	before_action :set_item, only: [:show, :edit, :update, :destroy]
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

	def destroy
		if @item.destroy 
			redirect_to items_path
		else
			redirect_to @item
		end
	end

	private

	def item_params
		params.require(:item).permit(:name, :brand_id,:color_id,:type_id)
	end

	def set_item
		@item = Item.find(params[:id])
	end
end
