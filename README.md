# furima テーブル設計



| Column              |    Type     | Option 

#userテーブル
| nickname            | string      | null: false        |
| email               | string      | null: false        | ユニーク制約
| encrypted_password  | string      | null: false        |
| kanji last name     | string      | null: false        |
| kanji first name    | string      | null: false        |
| kana last name      | string      | null: false        |
| kana first name     | string      | null: false        |
| birthday year       | string      | null: false        |
| birthday month      | string      | null: false        |
| birthday day        | string      | null: false        |


#item テーブル       
| item name           | string      | null: false        |
| explain             | text        | null: false        |
| category            | string      | null: false        |
| status              | string      | null: false        |
| delivery cost       | string      | null: false        |
| delivery place      | string      | null: false        |
| delivery day        | int         | null: false        |
| value               | int         | null: false        |
| user                | references  | null: false        | 外部キー



#purchase テーブル
| card number         | string      | null: false        |
| valid month         | string      | null: false        |
| valid year          | string      | null: false        |
| security cord       | string      | null: false        |
| post cord           | string      | null: false        |
| prefecture          | string      | null: false        |
| city                | string      | null: false        |
| address             | string      | null: false        |
| building            | string      |                    |
| phone number        | string      | null: false        |
| user                | references  | null: false        | 外部キー
| sell                | references  | null: false        |　外部キー
