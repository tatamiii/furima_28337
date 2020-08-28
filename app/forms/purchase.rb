# class Purchase

#   include ActiveModel::Model
#   attr_accessor :postal_code, :prefecture, :city, :adress, :building, :phone_number

#   with_options presence: true do
#     # validates :number
#     # validates :exp_month
#     # validates :exp_year
#     # validates :cvc
#     validates :postal_code
#     validates :prefecture
#     validates :city
#     validates :adress
#     validates :building
#     validates :phone_number
#   end


#   def save
#     Orders.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name,user_id: current_user.id)
#   end
  
# end