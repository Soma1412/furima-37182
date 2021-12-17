FactoryBot.define do
  factory :user do
    nickname              {"佐藤"}
    email                 {Faker::Internet.free_email}
    password              {"test123"}
    password_confirmation {"test123"}
    kanji_first_name      {"陸"}
    kanji_last_name        {"山田"}
    kana_first_name       {"リク"}
    kana_last_name        {"ヤマダ"}
    birth_date            {"1999-09-09"}
  end
end
