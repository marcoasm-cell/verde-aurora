class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  
  accepts_nested_attributes_for :order_items, allow_destroy: true, reject_if: proc { |attributes| attributes['product_id'].blank? }

end
