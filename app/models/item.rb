class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :load
  belongs_to :shipping_origin
  belongs_to :number_of_day
  
  belongs_to :user
  validates :title, :explanation, presence: true

  with_options numericality: { other_than: 1 , message: "can't be blank"} do
    validates :category_id
    validates :situation_id
    validates :load_id
    validates :shipping_origin_id
    validates :number_of_day_id
  end




  validates :image, presence: true 
  #今後の学習の為に残しておきます。
  # content_type: [:png, :jpg, :jpeg],
  # size: { less_than_or_equal_to: 1.megabytes },
  # dimension: { width: { max: 2000 }, height: { max: 2000 }}

  validates :title,              presence: true, length: { maximum: 40 }
  validates :explanation,        presence: true, length: { maximum: 1000 }
  validates :price,              presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end