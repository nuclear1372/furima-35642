require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '出品した商品が正しく保存されるとき' do
      it '入力された情報が全て正しいとき' do
        expect(@item).to be_valid
      end
    end

    context '出品した商品が保存されないとき' do
      it 'nameが空では保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages). to include("Name can't be blank")
      end
      it 'descriptionが空では保存できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages). to include("Description can't be blank")
      end
      it 'priceが空では保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages). to include("Price is not a number")
      end
      it 'priceの値が9999999を超えると保存できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'priceの値が300未満だと保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが半角数字でなければ保存できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'category_idが空では保存できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages). to include("Category can't be blank")
      end
      it 'status_idが空では保存できない' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages). to include("Status can't be blank")
      end
      it 'delivery_charge_idが空では保存できない' do
        @item.delivery_charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages). to include("Delivery charge can't be blank")
      end
      it 'prefecture_idが空では保存できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages). to include("Prefecture can't be blank")
      end
      it 'days_to_ship_idが空では保存できない' do
        @item.days_to_ship_id = nil
        @item.valid?
        expect(@item.errors.full_messages). to include("Days to ship can't be blank")
      end
      it 'userに紐づいていなければ保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages). to include("User must exist")
      end
      it 'imageが空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      
    end
  end
end
