class OrdersController < ApplicationController
  # before_action :set_exhibition, only:[:index]

  def index
    @exhibition = Exhibition.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
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
    params.permit(:price, :city, :adress, :building, :phone_number).merge(user_id: current_user.id)
  end

  def pay_params
    params.permit(:price, :token)
  end
 
  def pay_item
    Payjp.api_key = "sk_test_f159bc70f717fb6bd05b0dda"
    Payjp::Charge.create(
      amount: pay_params[:price],
      card: pay_params[:token],
      currency:'jpy'
    )
  end
 

end
