class ShopsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
  end

  def new
    @exhibition = Exhibition.new
  end

  def create
    @exhibition = Exhibition.new(item_params)
    if @exhibition.save
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
