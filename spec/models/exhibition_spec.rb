require 'rails_helper'

RSpec.describe @Exhibition, type: :model do
  describe '#create' do
    before do
      @exhibition = FactoryBot.build(:exhibition)
      @exhibition.image = fixture_file_upload('public/images/test_img.png')

    end

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it "要素が全て入力されているとき登録できる" do
          expect(@exhibition).to be_valid
        end
      end

      ## ユーザー情報
      context '新規登録がうまくいかないとき' do

        it '画像が必須であること' do
          @exhibition.image = nil
          @exhibition.valid?
          expect(@exhibition.errors.full_messages).to include("Image can't be blank")
        end

        it '商品名が必須であること' do
          @exhibition.item_name = ''
          @exhibition.valid?
          expect(@exhibition.errors.full_messages).to include("Item name can't be blank")
        end

        it '商品説明が必須であること' do
          @exhibition.item_info = ''
          @exhibition.valid?
          expect(@exhibition.errors.full_messages).to include("Item info can't be blank")
        end

        it 'カテゴリーが選択されていること' do
          @exhibition.category_id = '1'
          @exhibition.valid?
          expect(@exhibition.errors.full_messages).to include("Category must be other than 1")
        end

        it '商品状態が選択されていること' do
          @exhibition.condition_id = '1'
          @exhibition.valid?
          expect(@exhibition.errors.full_messages).to include("Condition must be other than 1")
        end

        it '配送料の負担が選択されていること' do
          @exhibition.fee_id = '1'
          @exhibition.valid?
          expect(@exhibition.errors.full_messages).to include("Fee must be other than 1")
        end

        it '発送地域が選択されていること' do
          @exhibition.sending_area_id = '1'
          @exhibition.valid?
          expect(@exhibition.errors.full_messages).to include("Sending area must be other than 1")
        end

        it '発送までの日数が選択されていること' do
          @exhibition.delivery_time_id = '1'
          @exhibition.valid?
          expect(@exhibition.errors.full_messages).to include("Delivery time must be other than 1")
        end

        it '299円だと出品できないこと' do
          @exhibition.item_price = '299'
          @exhibition.valid?
          expect(@exhibition.errors.full_messages).to include("Item price must be greater than or equal to 300")
        end

        it '10000000円だと出品できないこと' do
          @exhibition.item_price = '10000000'
          @exhibition.valid?
          expect(@exhibition.errors.full_messages).to include("Item price must be less than or equal to 9999999")
        end
        
      end
    end
  end
end
