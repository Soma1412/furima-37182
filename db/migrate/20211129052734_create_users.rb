class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :nickname,                  null:false
      t.string :emal,                      null:false
      t.string :encrypted_password,        null:false
      t.string :kanji_last_name,           null:false
      t.string :kanji_first_name,          null:false
      t.string :kana_last_name,            null:false
      t.string :kana_first_name,           null:false
      t.date   :birth_date,                null:false
      t.timestamps
    end
  end
end
