# furima テーブル設計

#userテーブル

| Column              |    Type    | Option 

| nickname             | string     | null: false|
| email               | string     | null: false                    | ユニーク制約
| encrypted_password  | string     | null: false                    |
| kanji last name             | string     | null: false                    |
| kanji first name     | string    | null: false|
| kana last name      | string     | null: false|
| kana first name     | string     | null: false|
| birthday year      | string      | null: false                    |
| birthday month     | string      | null: false    |
| birthday day       | string      | null: false    |


#sell テーブル       
| item name           | string      | null: false        |
| explain             | text        | null: false        |
| category            | string      | null: false        |
| status              | string      | null: false        |
| delivery cost       | string      | null: false        |
| delivery place      | string      | null: false        |
| delivery day        | int         | null: false        |
| value               | int         | null: false        |
| user                | string      | null: false        |



#purchase テーブル
| card                | string      | null: false        |
| valid  month        | string      | null: false        |
| valid   | ---------- | ------------------------------ |
| ------ | ---------- | ------------------------------ |
| ------ | ---------- | ------------------------------ |
| ------ | ---------- | ------------------------------ |
| ------ | ---------- | ------------------------------ |
| ------ | ---------- | ------------------------------ |
| ------ | ---------- | ------------------------------ |
| ------ | ---------- | ------------------------------ |
| ------ | ---------- | ------------------------------ |
