class BuyProductsController < ApplicationController
        before_action :set_product, only: [:create]
      
        # POST /buy_products
        def update
          @product = Product.find(product_params)
          if @product.save
            redirect_to root_path, notice: 'Товар был успешно добавлен.'
          else
            render :new
          end
        end
      
        private
          def set_product
            @product = Product.find(params[:id])
          end
      
          def product_params
            params.require(:product).permit(:id)
          end
end
      
