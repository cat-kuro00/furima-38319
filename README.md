## itemsテーブル
|Column        |Type      |Options                       |
|--------------|----------|------------------------------|
|item          |string    |null: false                   |
|info          |text      |null: false                   |
|category_id   |integer   |null: false                   |
|condition_id  |integer   |null: false                   |
|shipping_id   |integer   |null: false                   |
|ship_from_id  |integer   |null: false                   |
|ship_days_id  |integer   |null: false                   |
|price         |integer   |null: false                   |
|user          |references|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_one :buy


## usersテーブル
|Column     |Type  |Options                  |
|-----------|------|-------------------------|
|name       |string|null: false              |
|birthday   |date  |null: false              |
|nickname   |string|null: false              |
|email      |string|null: false, unique: true|
|password   |string|null: false              |
### Association
- has_many :items

## buysテーブル
|Column     |Type        |Options                       |
|-----------|------------|------------------------------|
|item       |references  |null: false, foreign_key: true|
|user       |references  |null: false, foreign_key: true|
### Association
- belongs_to :item
- belongs_to :user
- has_one :address

## addressテーブル
|Column     |Type        |Options                       |
|-----------|------------|------------------------------|
|post       |string      |null: false                   |
|prefecture |string      |null: false                   |
|city       |string      |null: false                   |
|block-num  |string      |                              |
|phone-num  |string      |null: false                   |
|user       |references  |null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :buy
