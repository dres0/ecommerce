class CartsController < ApplicationController
    # Para poder utilizar el carrito se debe primero esta autenticado como usuario
    before_action :authenticate_user!
  
    def update
      product = params[:cart][:product_id]  #le pasamos el producto
      quantity = params[:cart][:quantity]   #le pasamos la cantidad
      current_order.add_product(product, quantity) #le pasamos la oredn actual con los atributos
      redirect_to root_url, notice: "Product added successfuly" #lo redireccionamos al root index
    end
  
    def show
      @order = current_order
    end
end