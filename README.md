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
| category            | string      | null: false        |
| status              | string      | null: false        |
| delivery_cost       | string      | null: false        |
| delivery_place      | string      | null: false        |
| delivery_day        | integer     | null: false        |
| price               | integer     | null: false        |
| user_id             | references  | null: false foreign_key: true|

belongs_to: users
has_one: purchase



#purchases table
| post_cord           | string      | null: false        |
| prefecture          | string      | null: false        |
| city                | string      | null: false        |
| address             | string      | null: false        |
| building            | string      |                    |
| phone_number        | string      | null: false        |
| user_id             | references  | null: false  foreign_key: true     |
| item_id             | references  | null: false  foreign_key: true     |

belongs_to: users
belongs_to: purchases
has_one: histories 

#histories table
| user_id              | references | null: false  foreign_key: true     | 
| item_id              | references | null: false  foreign_key: true     |

belongs_to purchases
