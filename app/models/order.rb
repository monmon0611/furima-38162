class Order < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one :address

  # validates :user, :references, presence: true
  # validates :item, :references, presence: true
end
