

## itemsテーブル
|Column        |Type      |Options                       |
|--------------|----------|------------------------------|
|item          |string    |null: false                   |
|info          |text      |null: false                   |
|category_id   |integer   |null: false                   |
|condition_id  |integer   |null: false                   |
|shipping_id   |integer   |null: false                   |
|prefecture_id |integer   |null: false                   |
|ship_days_id  |integer   |null: false                   |
|price         |integer   |null: false                   |
|user          |references|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_one :buy


## usersテーブル
|Column            |Type  |Options                  |
|------------------|------|-------------------------|
|last_name         |string|null: false              |
|first_name        |string|null: false              |
|last_name_kana    |string|null: false              |
|first_name_kana   |string|null: false              |
|birthday          |date  |null: false              |
|nickname          |string|null: false              |
|email             |string|null: false, unique: true|
|encrypted_password|string|null: false              |
### Association
- has_many :items
- has_one :buy

## buysテーブル
|Column     |Type        |Options                       |
|-----------|------------|------------------------------|
|item       |references  |null: false, foreign_key: true|
|user       |references  |null: false, foreign_key: true|
### Association
- belongs_to :item
- belongs_to :user
- has_one :address

## addressesテーブル
|Column        |Type        |Options                       |
|--------------|------------|------------------------------|
|post          |string      |null: false                   |
|prefecture_id |integer     |null: false                   |
|city          |string      |null: false                   |
|block-num     |string      |null: false                   |
|building      |string      |                              |
|phone-num     |string      |null: false                   |
|buy           |references  |null: false, foreign_key: true|
### Association
- belongs_to :buy

