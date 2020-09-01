require 'rails_helper'
RSpec.describe Order, type: :model do
  before do
    @buyer = FactoryBot.create(:user)
    @seller = FactoryBot.create(:user)
    @exhibition = FactoryBot.build(:exhibition, user_id: @seller.id)
    @exhibition.image = fixture_file_upload('public/images/test_img.png')
    @exhibition.save

    @order = FactoryBot.build(:purchase)
    @order.user_id = @buyer.id
    @order.exhibition_id = @exhibition.id

  end

  describe '購入' do
    context '購入がうまくいくとき' do
      it "要素が全て入力されているとき購入できること" do
        expect(@order).to be_valid
      end

      it "建物名を入力していなくても登録できること" do
        @order.building =""
        expect(@order).to be_valid
      end

    end

    context '購入がうまくいかないとき' do
      it 'tokenが生成されていないと購入できないこと' do
        @order.token = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が空白だと購入できないこと' do
        @order.postal_code = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid")
      end

      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと購入できないこと' do
        @order.postal_code = "1234567"
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid")
      end

      it '都道府県がを選択していないと購入できないこと' do
        @order.prefecture = "1"
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it '市町村が空白でないと購入できないこと' do
        @order.city = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空白だと購入できないこと' do
        @order.adress = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Adress can't be blank")
      end

      it '電話番号が空白だと購入できないこと' do
        @order.phone_number = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号が11桁未満だと購入できないこと' do
        @order.phone_number = "0000000000"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end
    end

  end

end
