class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :move_to_index, only:[:index]

  def index
    @purchase_shipping_address = PurchaseShippingAddress.new
  end

  def create
    @purchase_shipping_address = PurchaseShippingAddress.new(shipping_address_params)
    if @purchase_shipping_address.valid?
      pay_item
      @purchase_shipping_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  
  def purchase_params
    params.permit(:item_id).merge(user_id: current_user.id, token: params[:token])
  end

  def shipping_address_params
    params.require(:purchase_shipping_address).permit(
      :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number
    ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    set_item
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end
end
