class Order < ApplicationRecord
  # Rlationships
  belongs_to :user
  has_many :order_items
  has_many :products, through: :order_items

  # validations
  validates :number, uniqueness: true
end
