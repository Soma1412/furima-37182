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

# items テーブル
| name                | string      | null: false        |
| category            | string      | null: false        |
| value               | int         | null: false        |
| user                | string      | null: false        |


#purchase テーブル
| user                | string      | null: false        |
| place               | string      | ------------------------------ |
| ------ | ---------- | ------------------------------ |
| ------ | ---------- | ------------------------------ |
| ------ | ---------- | ------------------------------ |
| ------ | ---------- | ------------------------------ |
| ------ | ---------- | ------------------------------ |
| ------ | ---------- | ------------------------------ |
| ------ | ---------- | ------------------------------ |
| ------ | ---------- | ------------------------------ |
| ------ | ---------- | ------------------------------ |
