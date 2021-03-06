class OrdersController < ApplicationController
  before_action :move_to_session, only:[:index]
  before_action :move_to_index, only:[:index]
  before_action :move_to_index2, only:[:index]
  before_action :exhibition_find, only:[:index,:create]


  def index
    @order = Purchase.new
  end

  def create
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
#  aaaa
  def order_params
    params.require(:purchase).permit(:price, :postal_code, :prefecture, :city, :adress, :building, :phone_number).merge(user_id: current_user.id,token:params[:token],id:params[:id])
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

  def exhibition_find
  @exhibition = Exhibition.find(params[:id])
  end

end
