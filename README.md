## usersテーブル

| Column          | Type   | Option      |
| --------------- | ------ | ----------- |
| email           | string | null: false |
| password        | string | null: false |
| nickname        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birth_day       | date   | null: false |

## Association

- has_many :items
- has_many :comments


## itemsテーブル

| Column           | Type       | Option                        |
| ---------------- | ---------- | ----------------------------- |
| name             | string     | null: false                   |
| text             | text       | null: false                   |
| category         | string     | null: false                   |
| condition        | string     | null: false                   |
| shipping_charges | string     | null: false                   |
| shipping_area    | string     | null: false                   |
| days_to_ship     | string     | null: false                   |
| selling_price    | integer    | null: false                   |
| user             | references | null: false foreign_key: true |

## Association

- belongs_to :user
- has_many :comments

## commentsテーブル

| Column | Type       | Option                        |
| ------ | ---------- | ----------------------------- |
| text   | text       | null: false                   |
| user   | references | null: false foreign_key: true |
| item   | references | null: false foreign_key: true |

## Association

- belongs_to :user
- belongs_to :item