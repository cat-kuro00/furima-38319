## itemsテーブル
|Column     |Type      |Options                       |
|-----------|----------|------------------------------|
|item       |string    |null: false                   |
|text       |text      |null: false                   |
|category   |string    |null: false                   |
|condition  |string    |null: false                   |
|shipping   |string    |null: false                   |
|ship-from  |string    |null: false                   |
|ship-days  |string    |null: false                   |
|price      |string    |null: false                   |
|user       |references|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_one :boughts


## usersテーブル
|Column     |Type  |Options                  |
|-----------|------|-------------------------|
|name       |string|null: false              |
|birthday   |text  |null: false              |
|nickname   |string|null: false              |
|email      |string|null: false, unique: true|
|password   |string|null: false              |
### Association
- has_many :items

## boughtsテーブル
|Column     |Type        |Options                       |
|-----------|------------|------------------------------|
|item       |references  |null: false, foreign_key: true|
|user       |references  |null: false, foreign_key: true|
### Association
- belongs_to :item
- belongs_to :user

## adressテーブル
|Column     |Type   |Options    |
|-----------|-------|-----------|
|post       |integer|null: false|
|prefecture |string |null: false|
|city       |string |null: false|
|block-num  |string |           |
|phone-num  |integer|null: false|


