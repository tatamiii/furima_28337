FactoryBot.define do
  factory :purchase do
    token {"token"}
    exhibition_id {""}
    price       {"500"}
    postal_code  {"254-0047"}
    prefecture   {rand(2..48)}
    city         {"平塚市"}
    adress       {"追分5-2"}
    building     {"ビル"}
    phone_number {"08067528614"}
  end
end
