FactoryBot.define do
  factory :exhibition do
    item_name {"bbb"}
    item_info {"ccc"}
    category_id {rand(2..10)}
    condition_id {rand(2..7)}
    fee_id {rand(2..3)}
    sending_area_id {rand(2..48)}
    delivery_time_id {rand(2..4)}
    item_price {rand(300..9999999)}
    user_id {rand(1..1000000)}
  end
end
