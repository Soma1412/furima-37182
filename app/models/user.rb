class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
        validates :nickname,         presence: true, length: { maximum: 6 }
        validates :kanji_last_name,  presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } 
        validates :kanji_first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } 
        validates :kana_last_name,   presence: true, format: { with: /\A[ァ-ヶ一]+\z/, message: '全角カタカナを使用してください' } 
        validates :kana_first_name,  presence: true, format: { with: /\A[ァ-ヶ一]+\z/, message: '全角カタカナを使用してください' } 
        validates :birth_date,       presence: true 
        PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
        validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
         has_many  :items
        # has_many  :purchase

end
