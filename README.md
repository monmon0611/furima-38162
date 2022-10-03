# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## users テーブル

| Column              | Type   | Options                   |
| ------------------- | ------ | ------------------------- |
| nikname             | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               | 
| first_name          | string | null: false               |
| last_name           | string | null: false               |
| first_katakana_name | string | null: false               |
| last_katakana_name  | string | null: false               |
| date_of_birth       | date   | null: false               |


### Association

- has_many :items
- has_many :orders

## items テーブル

| Column            | Type       | Options                       |
| ------------------| ---------- | ----------------------------- |
| title              | string      | null: false                   |
| explanation        | text        | null: false                   |    
| category_id        | integer     | null: false                   |
| situation_id       | integer     | null: false                   |
| load_id            | integer     | null: false                   |
| shipping_origin_id | integer     | null: false                   |    
| number_of_day_id   | integer     | null: false                   |
| price              | integer     | null: false                   |
| user               | references  | null: false,foreign_key: true |

### Association

- belongs_to :user
- belongs_to :order

## orders テーブル

| Column     | Type       | Options                        |
| ------     | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one    :addresser

## addressers テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_code          | string     | null: false                    |
| shipping_origin_id | integer    | null: false                    |
| municipality       | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     | null: false                    |
| phone_number       | integer    | null: false                    |
| orders             | references | null: false, foreign_key: true |

### Association

- has_one :orders
