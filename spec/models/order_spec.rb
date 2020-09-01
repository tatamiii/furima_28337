require 'rails_helper'
RSpec.describe Order, type: :model do
  before do
    @buyer = FactoryBot.create(:user)
    @seller = FactoryBot.create(:user)
    @exhibition = FactoryBot.build(:exhibition, user_id: @seller.id)
    @exhibition.image = fixture_file_upload('public/images/test_img.png')
    @exhibition.save

    @order = FactoryBot.build(:order)
    @order.user_id = @buyer.id
    @order.exhibition_id = @exhibition.id

  end

  describe '購入' do
    context '購入がうまくいくとき' do
      it "要素が全て入力されているとき登録できる" do
        expect(@order).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it '郵便番号が空でであること' do
        @order.postal_code = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
      end

      # it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      #   @order.postal_code = '1234567'
      #   @order.valid?
      #   expect(@user_donation.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")

      # it '都道府県が---でないこと' do
      #   @order.prefecture = "1"
      #   @order.valid?
      #   expect(@order.errors.full_messages).to include("Prefecture must be other than 1")
      # end

      # it '市町村が入力されていること' do
      #   @order.city = ""
      #   @order.valid?
      #   expect(@order.errors.full_messages).to include("City can't be blank")
      # end

      # it '住所が入力されていること' do
      #   @order.adress = ""
      #   @order.valid?
      #   expect(@order.errors.full_messages).to include("Adress can't be blank")
      # end

      # it '電話番号が入力されていること' do
      #   @order.phone_number = ""
      #   @order.valid?
      #   expect(@order.errors.full_messages).to include("Phone number can't be blank")
      # end

    end

  end

end
