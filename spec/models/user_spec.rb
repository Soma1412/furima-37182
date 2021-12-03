require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    context '新規登録できるとき' do
      it '新規登録に必要な情報が正しく入力されている' do
        expect(@user).to be_valid
      end
    end

   context '新規登録できないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailアドレスが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailアドレスは＠が必要であること' do
      @user.email = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include()
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'パスワードは、半角英数字混合での入力が必須であること' do
      @user.password = 'あああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it '名前は苗字が空では登録できない' do
      @user.kanji_last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Kanji last name can't be blank")
    end

    it '名前は名前が空では登録できない' do
      @user.kanji_first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Kanji first name can't be blank")
    end

    it '苗字は全角以外では登録できない' do
      @user.kanji_last_name = '11111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Kanji last name 全角文字を使用してください")
    end
    it '名前は全角以外では登録できない' do
      @user.kanji_first_name = '11111'
      @user.valid?
      expect(@user.errors.full_messages).to include
    end

    it 'カナ名前は苗字が空では登録できない' do
      @user.kana_last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana last name can't be blank")
    end

    it 'カナ名前は名前が空では登録できない' do
      @user.kana_first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana first name can't be blank")
    end

    it 'カナ苗字はカタカナでの入力が必須である' do
      @user.kana_first_name = '333333'
      @user.valid?
      expect(@user.errors.full_messages).to include
    end

    it 'カナ名前はカタカナでの入力が必須である' do
      @user.kana_last_name = '3333333'
      @user.valid?
      expect(@user.errors.full_messages).to include
    end
    
    it '生年月日が空では登録できない' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
    
    it 'パスワードが英字のみの場合登録できない' do
      @user.password = 'aiwuesk'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end
    
    it 'パスワードが数字のみの場合登録出来ない' do
      @user.password = '1111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end
  end
 end
end