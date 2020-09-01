class ExhibitionsController < ApplicationController
  before_action :move_to_index, except: [:index,:show]
  before_action :set_exhibition, only:[:show,:edit]
  before_action :move_to_index2, only:[:edit]
  before_action :order, only:[:show]

  def index
    @exhibitions = Exhibition.all.order("created_at DESC")
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

  def show
    category = Category.all
  end

  def destroy
    exhibition = Exhibition.find(params[:id])
    exhibition.destroy
    if exhibition.destroy
      redirect_to root_path
    else
      redirect_to exhibition_path
    end
  end

  def edit
  end

  def update
    @exhibition = Exhibition.find(params[:id])
    @exhibition.update(item_params)
    if @exhibition.save
      redirect_to root_path
    else 
      render :edit
    end
  end

  private

  def item_params
    params.require(:exhibition).permit(:image,:item_name,:item_info,:category_id,:condition_id,:fee_id,:sending_area_id,:delivery_time_id,:item_price).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def move_to_index2
    unless user_signed_in? && current_user.id == @exhibition.user_id
      redirect_to root_path
    end
  end

  def set_exhibition
  @exhibition = Exhibition.find(params[:id])
  end

  def order
    @order = Order.where(exhibition_id: @exhibition.id)
  end
  
end
