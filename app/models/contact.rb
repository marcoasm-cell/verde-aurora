class Contact < ApplicationRecord
  belongs_to :product, optional: true
  belongs_to :color, optional: true
end
