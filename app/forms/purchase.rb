class Purchase

  include ActiveModel::Model
  attr_accessor :number, :exp_month, :exp_year, :cvc, :postal_code, :prefecture, :city, :adress, :building, :phone_number

end