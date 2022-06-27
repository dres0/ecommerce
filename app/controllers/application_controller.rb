class ApplicationController < ActionController::Base
    #Esto evitara que otros usuarios se intercepten con el carrito del usuario actual
    def current_order
      if current_user
        order = Order.where(user_id: current_user.id).where(state: "created").last
        if order.nil?
          order = Order.create(user: current_user, state: "created")
        end
        return order
      end
      nil
    end
end