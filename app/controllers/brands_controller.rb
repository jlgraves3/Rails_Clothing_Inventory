class BrandsController < ApplicationController
	before_action :set_brand, only: [:show, :destroy]
	def index
		@brands = Brand.all
	end

	def show
		@brand = Brand.find(params[:id])
	end

	def new 
		@brand = Brand.new
	end

	def create
		@brand = Brand.new(brand_params)
		if @brand.valid?
			@brand.save
			redirect_to brands_path
		else
			flash[:notice] = @brand.errors.full_messages.join(', ') 
			redirect_to new_brand_path
		end
	end

	def destroy
		if @brand.destroy
			redirect_to brands_path
		else
			redirect_to @brand
		end
	end

	private

	def brand_params
		params.require(:brand).permit(:name)
	end

	def set_brand
		@brand = Brand.find(params[:id])
	end

end
