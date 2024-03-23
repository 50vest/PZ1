class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :set_product, only: [:show, :edit, :update, :destroy] 
  before_action :require_admin, only: [:edit, :update, :destroy]
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params.merge(user_id: current_user.id))
    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    end
  end

  def edit
    authorize @product
    if @product.edit(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
  end
end

  def update
    authorize @product
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end 
    def destroy
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end
  
  private
  def set_product
    @product = Product.find(params[:id])
  end
end

def require_admin
  if current_user.role == 'user'
    redirect_to root_path, alert: 'У вас нет прав для выполнения этого действия'
  end
end

 def product_params
  params.require(:product).permit(:name, :description, :price, :rating, :avatar)
end