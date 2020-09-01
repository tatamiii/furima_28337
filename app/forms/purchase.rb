class Purchase

  include ActiveModel::Model
  attr_accessor :number,:exp_month,:exp_year,:cvc,:price, :postal_code, :prefecture, :city, :adress, :building, :phone_number, :token, :id, :user_id, :exhibition_id

  with_options presence: true do
    validates :token
    validates :postal_code,format: {with: /\A\d{3}[-]\d{4}\z/} 
    validates :prefecture,numericality: { other_than: 1 }
    validates :city
    validates :adress
    validates :phone_number,format: {with: /\A\d{11}\z/}
  end


  def save
    Order.create(
      price: price,
      postal_code: postal_code,
      prefecture: prefecture,
      city: city,
      adress: adress,
      building: building,
      phone_number: phone_number,
      user_id: user_id,
      exhibition_id:id)
  end
  
end