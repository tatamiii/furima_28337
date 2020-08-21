class ShopsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
  end

  def new
    @item = Exhibition.new
  end

  def create
    @item = Exhibition.new(item_params)
    if @item.save
      redirect_to root_path    
    else
     render :new
    end
  end
  private

  def item_params
    params.permit(:image,:item_name,:item_info,:category_id,:condition_id,:fee_id,:sending_area_id,:delivery_time_id,:item_price).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
