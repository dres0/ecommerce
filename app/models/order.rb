class Order < ApplicationRecord
  # Rlationships
  belongs_to :user
  has_many :order_items
  has_many :products, through: :order_items

  # validations
  validates :number, uniqueness: true

  # Siempre y cuando exista un producto y un stock mayor a cero puedo generar la orden
  def add_product(product_id, quantity)
    product = Product.find(product_id)
    if product && (product.stock > 0)
      order_items.create(product_id: product.id, quantity: quantity, price: product.price)
      total_value
    end
  end

  def total_value
    sum = 0
    order_items.each do |item|
      sum += item.price
    end
    update_attributes(total_value: sum)
  end
end
