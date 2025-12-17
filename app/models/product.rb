class Product < ApplicationRecord
  has_many :product_categories
  has_many :categories, through: :product_categories
  has_one_attached :image
  has_many_attached :images

  accepts_nested_attributes_for :product_categories, reject_if: ->(attributes){ attributes['category_id'].blank? }, allow_destroy: true
  def image_url
    ActiveStorage::Current.url_options = {host: "127.0.0.1", port: 3000}
    images&.first&.url
  end
end
