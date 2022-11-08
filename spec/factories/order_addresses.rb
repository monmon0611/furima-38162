FactoryBot.define do
  factory :order_address do
    post_code {'123-4567'}
    shipping_origin_id {2}
    municipality {'横浜区緑区'}
    address {'青山1-1'}
    building_name {'ビル'}
    phone_number {'09012345678'}
    token {'asdfghjklzxcvb123'}
  end
end
