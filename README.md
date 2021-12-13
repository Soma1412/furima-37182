# furima テーブル設計



| Column              |    Type     | Option 

#users table
| nickname            | string      | null: false        |
| email               | string      | null: false unique: true| 
| encrypted_password  | string      | null: false        |
| kanji_last_name     | string      | null: false        |
| kanji_first_name    | string      | null: false        |
| kana_last_name      | string      | null: false        |
| kana_first_name     | string      | null: false        |
| birth_date          | date        | null: false        |

has_many: items
has_many: purchases 


#items table      
| item_name           | string      | null: false        |
| explain             | text        | null: false        |
| category_id         | integer     | null: false        |
| condition_id           | integer     | null: false        |
| delivery_cost_id    | integer     | null: false        |
| delivery_place_id   | integer     | null: false        |
| delivery_day_id     | integer     | null: false        |
| price               | integer     | null: false        |
| user                | references  | null: false foreign_key: true|

belongs_to: user
has_one: purchase

#purchases table
| user                 | references | null: false  foreign_key: true     | 
| item                 | references | null: false  foreign_key: true     |

belongs_to: user
belongs_to: item
has_one: address


#addresses table
| post_code           | string      | null: false        |
| prefecture_id       | integer     | null: false        |
| city                | string      | null: false        |
| address             | string      | null: false        |
| building            | string      |                    |
| phone_number        | string      | null: false        |
| purchase            | references  | null: false  foreign_key: true     |

belongs_to: purchase








