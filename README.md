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

# テーブル設計

## users テーブル

| Column          | Type   | Options                          |
| --------------- | ------ | -------------------------------- |
| email           | string | null: false, uniqueness: true    |
| password        | string | null: false,                     |


### Association

- has_one :profile
- has_one :teacher
- has_many :articles
- has_many :tutorial
- has_many :tips
- has_many :comments
- has_many :orders
- has_many :teacher_evaluations


## admin テーブル

| Column          | Type   | Options                          |
| --------------- | ------ | -------------------------------- |
| email           | string | null: false, uniqueness: true    |
| password        | string | null: false,                     |


### Association

- has_many :tutorial
- has_many :tips


## profiles テーブル

| Column           | Type       | Options                          |
| ---------------- | ---------- | -------------------------------- |
| user             | references | null: false, foreign_key: true   |
| nickname         | string     | null: false                      |
| learning_history | string     | null: false,                     |
| purpose          | text     | null: false,                     |
| birth_date       | data       | null: false                      |


### Association

- belongs_to :user

## articles テーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| user               | references  | null: false, foreign_key: true |
| title              | string      | null: false                    |
| content            | text        | null: false                    |
| category_id        | integer     | null: false                    |

### Association

- belongs_to :user
- has_many :comments
- has_many :teacher_comments

## comments テーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| user               | references  | null: false, foreign_key: true |
| articles           | references  | null: false, foreign_key: true |
| content            | text        | null: false                    |

### Association

- belongs_to :user
- belongs_to :article


## tutorials テーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| admin              | references  | null: false, foreign_key: true |
| title              | string      | null: false                    |
| content            | text        | null: false                    |
| tuto_category_id   | integer     | null: false                    |

### Association

- belongs_to :admin

##ここまで一旦見た目整備##########################


## teachers テーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| teach_content      | string      | null: false                    |
| teach_detail       | text        | null: false                    |
| teacher_history    | text        | null: false                    |
| nickname           | string      | null: false                    |
| plan_id            | integer     | null: false                    |

### Association

- has_many :teacher_comments
- has_many :orders
- has_many :teacher_evaluations
- has_many :introduce

## teacher_comments テーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| article            | references  | null: false, foreign_key: true |
| teacher            | references  | null: false, foreign_key: true |
| content            | text        | null: false                    |

### Association

- belongs_to :teacher
- belongs_to :article



## orders テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| teacher       | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :teacher


## teacher_evaluations テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| teacher       | references | null: false, foreign_key: true |
| evaluation_id | integer    | null: false                    |
| review        | text       | null: false                    |


### Association

- belongs_to :user
- belongs_to :teacher


## tips テーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| admin              | references  | null: false, foreign_key: true |
| title              | string      | null: false                    |
| content            | text        | null: false                    |


### Association

- belongs_to :admin


## introduce テーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| user               | references  | null: false, foreign_key: true |
| title              | string      | null: false                    |
| content            | text        | null: false                    |

### Association

- belongs_to :user

