class Address < ApplicationRecord
  belongs_to :order

  # with_options presence: true do
  #   validates :post_code
  #   validates :shipping_origin_id
  #   validates :municipality
  #   validates :address
  #   validates :phone_number
  #   validates :order
  # end

end
