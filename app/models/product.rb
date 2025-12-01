class Product < ApplicationRecord
  belongs_to :category
  has_one_attached :image
  has_many_attached :images

  def image_url
    ActiveStorage::Current.url_options = {host: "127.0.0.1", port: 3000}
    images&.first&.url
  end
end
