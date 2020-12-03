## usersテーブル

| Column             | Type   | Option      |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birth_day          | date   | null: false |

## Association

- has_many :items
- has_many :comments
- has_many :buy_infos


## itemsテーブル

| Column         | Type       | Option                        |
| -------------- | ---------- | ----------------------------- |
| name           | string     | null: false                   |
| text           | text       | null: false                   |
| category_id    | integer    | null: false                   |
| condition_id   | integer    | null: false                   |
| charge_id      | integer    | null: false                   |
| prefecture_id  | integer    | null: false                   |
| days_ship_id   | integer    | null: false                   |
| price          | integer    | null: false                   |
| user           | references | null: false foreign_key: true |

## Association

- belongs_to :user
- has_many :comments
- has_one :buy_info

## commentsテーブル

| Column | Type       | Option                        |
| ------ | ---------- | ----------------------------- |
| text   | text       | null: false                   |
| user   | references | null: false foreign_key: true |
| item   | references | null: false foreign_key: true |

## Association

- belongs_to :user
- belongs_to :item

## buy_infosテーブル

| Column | Type       | Option                        |
| ------ | ---------- | ----------------------------- |
| user   | references | null: false foreign_key: true |
| item   | references | null: false foreign_key: true |

## Association

- belongs_to :user
- belongs_to :item
- has_one :adress

## adressesテーブル

| Column         | Type       | Option                        |
| -------------- | ---------- | ----------------------------- |
| postal_code    | string     | null: false                   |
| prefecture_id  | integer    | null: false                   |
| city           | string     | null: false                   |
| house_num      | string     | null: false                   |
| house_name     | string     |                               |
| phone_num      | string     | null: false                   |
| buy_info       | references | null: false foreign_key: true |

## Association

- belongs_to :buy_info