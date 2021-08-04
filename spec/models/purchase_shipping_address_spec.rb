require 'rails_helper'

RSpec.describe PurchaseShippingAddress, type: :model do
  describe '商品購入機能' do
    before do
      @purchase_shipping_address = FactoryBot.build(:purchase_shipping_address)
    end
    context '購入できるとき' do
      it '入力された情報が全て正しければ購入できる' do
        expect(@purchase_shipping_address).to be_valid
      end
      it 'building_nameは空でも購入できる。' do
        @purchase_shipping_address.building_name = ''
        expect(@purchase_shipping_address).to be_valid
      end
    end

    context '購入できないとき' do
      it 'tokenが空では購入できない' do
        @purchase_shipping_address.token = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idがなければ購入できない' do
        @purchase_shipping_address.user_id = nil
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idがなければ購入できない' do
        @purchase_shipping_address.item_id = nil
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'prefecture_idが空では購入できない' do
        @purchase_shipping_address.prefecture_id = nil
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが0では購入できない' do
        @purchase_shipping_address.prefecture_id = 0
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'postal_codeが空では購入できない' do
        @purchase_shipping_address.postal_code = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeに、3桁の数字の後にハイフンがあって、4桁の数字が続く形でなければ購入できない' do
        @purchase_shipping_address.postal_code = '1234-567'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'cityが空では購入できない' do
        @purchase_shipping_address.city = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空では購入できない' do
        @purchase_shipping_address.house_number = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空では購入できない' do
        @purchase_shipping_address.phone_number = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが10桁未満では保存できない' do
        @purchase_shipping_address.phone_number = '123456789'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include('Phone number is too short')
      end
      it 'phone_numberが数字以外は保存できない' do
        @purchase_shipping_address.phone_number = 'aaaaaaaaaaa'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
    end
  end
end
