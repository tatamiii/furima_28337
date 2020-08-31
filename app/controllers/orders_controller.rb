class OrdersController < ApplicationController
  # before_action :set_exhibition, only:[:index]
  before_action :move_to_session, only:[:index]
  before_action :move_to_index, only:[:index]
  before_action :move_to_index2, only:[:index]


  def index
    @exhibition = Exhibition.find(params[:id])
  end

  def create
    @order = Order.new(
      price:order_params[:price],
      postal_code:order_params[:postal_code],
      prefecture:order_params[:prefecture],
      city:order_params[:city],
      adress:order_params[:adress],
      phone_number:order_params[:phone_number],
      user_id:order_params[:user_id],
      exhibition_id:params[:id])

    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render :index
    end
  end
 
  private
 
  def order_params
    params.permit(:price, :postal_code, :prefecture, :city, :adress, :building, :phone_number).merge(user_id: current_user.id)
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
 
  def move_to_session
    unless user_signed_in?
      redirect_to user_session_path
    end
  end

  def move_to_index
    @exhibition = Exhibition.find(params[:id])
    if current_user.id == @exhibition.user_id
      redirect_to root_path
    end
  end

  def move_to_index2
    @exhibition = Exhibition.find(params[:id])
    if @exhibition.order.present?
      redirect_to root_path
    end
  end

end
