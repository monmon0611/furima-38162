class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :shipping_origin_id, :municipality, :address, :building_name, :phone_number, :user_id, :item_id, :token



  with_options presence: true do
  #住所用
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shipping_origin_id, numericality: {other_than: 1}
    validates :municipality
    validates :address
    validates :phone_number, format: {with: /\A\d{10,11}\z/} #message: "ハイフンなし10桁or11桁"
  #購入記録
    validates :user_id
    validates :item_id
  #トークン
    validates :token
  end

  def save
    # 購入情報を保存
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    # order_idには、変数orderのidと指定する
    Address.create(post_code: post_code, shipping_origin_id: shipping_origin_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end

