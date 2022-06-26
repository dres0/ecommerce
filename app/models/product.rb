class Product < ApplicationRecord
    #Rlationships
    has_and_belongs_to_many :categories
end
