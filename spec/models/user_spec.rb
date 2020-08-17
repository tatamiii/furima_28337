require 'rails_helper'

# bundle exec rspec spec/models/user_spec.rb
# @user.errors.full_messages


RSpec.describe @User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
  ## ユーザー情報
    it "ニックネームが必須であること" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "メールアドレスが必須であること" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "メールアドレスが一意性であること" do
      test = @user.dup
      @user.save
      test.valid?
      expect(test.errors.full_messages).to include("Email has already been taken", "Email has already been taken")
    end

    it "メールアドレスは@を含む必要があること" do
      @user.email = 'soumagmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "パスワードが必須であること" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank",
        "Password can't be blank",
        "Password is invalid",
        "Password is too short (minimum is 6 characters)",
        "Password confirmation doesn't match Password")
    end

    it "パスワードは6文字以上であること" do
      @user.password = 'abcd1'
      @user.password_confirmation = 'abcd1'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)", "Password is too short (minimum is 6 characters)")
    end

    it "パスワードは半角英数字混合であること" do
      @user.password = 'abcdef'
      @user.password_confirmation = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "パスワードは確認用を含めて2回入力すること" do
      @user.password = 'abcde1'
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    #本人情報確認
    it "ユーザー本名が、名字と名前がそれぞれ必須であること" do
      @user.first_name = ''
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid", "Last name can't be blank", "Last name is invalid")
    end

    it "ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること" do
      @user.first_name = 'abcdef'
      @user.last_name = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid", "Last name is invalid")
    end

    it "ユーザー本名のフリガナが、名字と名前でそれぞれ必須であること" do
      @user.first_name_kana = ''
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana is invalid", "Last name kana can't be blank", "Last name kana is invalid")
    end

    it "ユーザー本名のフリガナは全角（カタカナ）で入力させること" do
      @user.first_name_kana = 'ｿｳﾏ'
      @user.last_name_kana = 'ﾀﾞｲｽｹ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid", "Last name kana is invalid")
    end

    it "生年月日が必須であること" do
      @user.birth_date  = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
end