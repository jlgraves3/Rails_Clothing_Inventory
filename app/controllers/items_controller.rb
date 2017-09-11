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
	end

	def create
		@item = Item.new(item_params)
		if @item.valid?
			@item.save
			redirect_to @item
		else
			alert('error')
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
		params.require(:author).permit(:brand_id,:color_id,:type_id)
	end

	def set_item
		@item = Item.find(params[:id])
	end
end
