class OrdersController < ApplicationController
  # before_action :set_exhibition, only:[:index]
  before_action :move_to_session, only:[:index]
  before_action :move_to_index, only:[:index]
  before_action :move_to_index2, only:[:index]


  def index
    @exhibition = Exhibition.find(params[:id])
    @order = Purchase.new
  end

  def create
    @exhibition = Exhibition.find(params[:id])
    @order = Purchase.new(order_params)

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
    params.require(:purchase).permit(:price, :postal_code, :prefecture, :city, :adress, :building, :phone_number, :token, :id).merge(user_id: current_user.id)
  end
 
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
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
