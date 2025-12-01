class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
  belongs_to :color, optional: true
  belongs_to :fragance, optional: true

end
