class OrdersController < ApplicationController
  # before_action :set_exhibition, only:[:index]

  def index
    @exhibition = Exhibition.find(params[:id])
  end

  def create
    # @order = Order.new(order_params)

    @order = Order.new(
      price:order_params[:price],
      city:order_params[:city],
      adress:order_params[:adress],
      phone_number:order_params[:phone_number],
      user_id:order_params[:user_id])

    # @exhibition = Exhibition.find(params[:id])
    if @order.valid?
      pay_item
      @order.save
      # @exhibiton.update(purchaser_id: params[:user_id])
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
