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
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end

    it 'emailアドレスが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
    end

    it 'emailアドレスは＠が必要であること' do
      @user.email = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールは不正な値です")
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end

    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
    end

    it '全角文字が含まれたパスワードは登録できない' do
      @user.password = 'あああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
    end
    
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end

    it '名前は苗字が空では登録できない' do
      @user.kanji_last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字を入力してください")
    end

    it '名前は名前が空では登録できない' do
      @user.kanji_first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名前を入力してください")
    end

    it '苗字は全角以外では登録できない' do
      @user.kanji_last_name = '11111'
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字全角文字を使用してください")
    end
    it '名前は全角以外では登録できない' do
      @user.kanji_first_name = '11111'
      @user.valid?
      expect(@user.errors.full_messages).to include("名前全角文字を使用してください")
    end

    it 'カナ名前は苗字が空では登録できない' do
      @user.kana_last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字カナを入力してください")
    end

    it 'カナ名前は名前が空では登録できない' do
      @user.kana_first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名前カナを入力してください")
    end

    it 'カナ苗字はカタカナ以外での入力は登録できない' do
      @user.kana_last_name = '333333'
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字カナ全角カタカナを使用してください")
    end

    it 'カナ名前はカタカナ以外での入力は登録できない' do
      @user.kana_first_name = '3333333'
      @user.valid?
      expect(@user.errors.full_messages).to include("名前カナ全角カタカナを使用してください")
    end
    
    it '生年月日が空では登録できない' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("生年月日を入力してください")
    end
    
    it 'パスワードが英字のみの場合登録できない' do
      @user.password = 'aiwuesk'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
    end
    
    it 'パスワードが数字のみの場合登録出来ない' do
      @user.password = '1111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
    end
  end
 end
end