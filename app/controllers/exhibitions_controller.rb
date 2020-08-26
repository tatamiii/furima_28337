class ExhibitionsController < ApplicationController
  before_action :move_to_index, except: [:index,:show]

  def index
    @exhibitions = Exhibition.all
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
    @exhibition = Exhibition.find(params[:id])
    category = Category.all
  end

  def destroy
    exhibition = Exhibition.find(params[:id])
    exhibition.destroy
    if exhibition.destroy
      redirect_to root_path
    end
  end

  def edit
    @exhibition = Exhibition.find(params[:id])
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

end
