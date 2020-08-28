class OrdersController < ApplicationController
  # before_action :set_exhibition, only:[:index]

  def index
    @exhibition = Exhibition.find(params[:id])
  end

  def create
    @order = Order.new(
      price:   order_params[:price],
      city:    order_params[:city],
      adress:  order_params[:adress],
      building:order_params[:building],
      phone_number: order_params[:phone_number])
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
 
  private
 
  def order_params
    params.permit(:price, :city, :adress, :building, :phone_number, :token)
  end
 
  def pay_item
    Payjp.api_key = "sk_test_f159bc70f717fb6bd05b0dda"
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency:'jpy'
    )
  end
 

end
