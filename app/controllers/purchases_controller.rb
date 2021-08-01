class PurchasesController < ApplicationController
  before_action :set_item

  def index
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      ShippingAddress.create(shipping_address_params(@purchase.id))
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.permit(:item_id).merge(user_id: current_user.id, token: params[:token])
  end

  def shipping_address_params(purchase_id)
    params.require(:purchase).permit(
      :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number
    ).merge(purchase_id: purchase_id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
