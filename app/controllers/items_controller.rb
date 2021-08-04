class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def soldout_item(item_id)
    if  Purchase.find_by(item_id: item_id)
      return true
    end
  end
  helper_method :soldout_item

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :delivery_charge_id, :prefecture_id,
                                 :price, :days_to_ship_id).merge(user_id: current_user.id)
  end

  def move_to_index
    item = Item.find(params[:id])
    if current_user.id != item.user_id
      redirect_to root_path
    elsif current_user.id == item.user_id && Purchase.find_by(item_id: item.id)
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
