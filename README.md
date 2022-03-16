# README

This README is a document steps are necessary to get the
application up.

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

# アプリケーション名

アプリケーション名は「ブログる！」です。

# アプリケーション概要

「ブログる！」は、個人でブログや比較サイトを立ち上げたいという思いがある人に向けた、記事作成方法の学習サイトです。

ブログや比較サイト版の「MENTA」を目指して作りました。

ユーザーは2種類いて、UserとTeacherです。CtoCのビジネス形態で、Teacherが自分のSEOやコピーライティングの知識を、月額1000~3000円でUserに売ります。

「ブログる！」のメイン機能は、実際に記事を書いて投稿をする機能です。記事をサイト内
で公開することによって、チュートリアルやTeacherから教えてもらったことのアウトプットができます。

また、他のUserや契約していないTeacherからもコメントをもらうことができるので、それも参考にして学習することができます。

Teacherはまだ契約していないUserの記事にコメントをすることで、それが結果的に営業になります。

# アプリURL

https://blogru.herokuapp.com/

# テスト用アカウント

## user

メールアドレス：k@k.k
パスワード：    kensho1

## teacher

メールアドレス：k@k.k
パスワード：    kensho1

# 利用方法

## 通常のUserの利用方法

1.新規登録をする。
2.プロフィールを作成する。
2.チュートリアルでSEOやコピーライティングの学習をする。
3.学習内容を元に、実際にサイト内で記事を投稿する。
4.飛んできたコメントやいいねの数を元に、自分の悪いところを学習する。
5.良さそうなTeacherがいたら契約して、記事の添削をしてもらう。

## Teacher側のユーザーの利用方法

1.新規登録をする。
2.Tipsで人気Teacherになるヒントを得る。
3.Userの記事にコメントをして気に入ってもらい、契約してもらいます。
4.翌月も契約し続けてもらうために良いアドバイスをし続ける。

# 目指した課題解決

ブログや比較サイトの運用方法の学習を、1つのサイトで完結させること課題としてこのウェブアプリを作成しました。

ブログなどの運用方法の学習手段として、参考書や記事は、世の中に多くあります。

学習に必要な要素とは、3割のインプットと7割のアウトプットです。

しかし、プログラミングのPROGATE(プロゲート)やMENTA(メンタ)のような、インプットと同時にアウトプットをしたり、教えたい人と教わりたい人をマッチングすることができるサービスが、この分野にはありません。

これを解決したのが、「ブログる！」というサービスです。

# 要件定義(機能紹介)

## ユーザー登録機能

ユーザーとして登録することができます。ユーザー登録をしないと、多くの機能を使うことができません。

## ユーザーのプロフィール機能

プロフィールを作成・編集することができる。

## Teacher登録機能

SEOやコピーライティングなどの知識を教えたい人が「ブログる！」に登録する機能。Teacherはユーザーが作った記事にコメントを投稿し、自身を営業し、定期課金をしてもらう契約を取ってくる。Teacherは月額1000~3000円(内20%は手数料)をユーザーに課金してもらう代わりに、そのユーザー投稿する記事の添削などを行う。

## 記事作成・編集・投稿機能

実際にアプリ内で記事を作成(リッチテキストを用いて)し、公開することができる。

## チュートリアル機能

ユーザーはチュートリアルを見て、SEOやコピーライティングについて学習することができる。

## コメント機能

ユーザーやTeacherは、ユーザーの記事にコメントをすることができる。しかし、Teacherのコメントは、記事の作者かTeacherにしか見ることができない。

## いいね機能

記事の投稿に「いいね！」することができる。いいねのマークはハートで表現していて、いいね数で記事の質を判断することができる。

## 通知機能

他のユーザーからもらったコメントの通知をもらうことができる。

## Teacherとの契約機能

ユーザーは気に入ったTeacherに月額1000~3000円を払って記事作成を教わることができる。
ユーザーの払う月額の内20%は手数料となり、80%が契約を取ったTeacherのものとなる。

## Teacherに対する評価機能

ユーザーはTeacherに対して、コメントと5段階の評価をつけることができる。Teacherの詳細画面の上部に平均の5段階評価が星の見た目で表示されていて、一目で良いTeacherか悪いTeacherかを確認することができる。

## 各ユーザーの全ての記事の閲覧機能

ユーザーやTeacherは、気になった他のユーザーの記事の一覧を見ることができる。

## Teacherコメントに対する通知機能(未実装)

Teacherのコメントをもらった際にユーザーに通知する機能。

## ユーザーとTeacherのダイレクトメッセージ機能(未実装)

ユーザーとTeacherがダイレクトメッセージで会話し、より学習の柔軟性を実現する。

## Teacherの記事投稿機能(未実装)

Teacherが記事を投稿することができる機能。Teacherが記事を投稿することによって、ユーザーはよりTeacherを選びやすくなる。

## 記事のランキング機能(未実装)

いいね数などでアルゴリズムを作り、記事のランキングを表示することで、ユーザーの競争心をくすぐり、サイトの拡大を狙う。


# データベース・テーブル設計
<img width="447" alt="スクリーンショット 2020-11-27 9 03 09" src="https://user-images.githubusercontent.com/71964754/100398120-74ec5000-3090-11eb-9a7d-7fb1de2c5eb9.png">

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


## teachers テーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| teach_content      | string      | null: false                    |
| teach_detail       | text        | null: false                    |
| teacher_history    | text        | null: false                    |
| nickname           | string      | null: false                    |
| plan_id            | integer     | null: false                    |
| email              | string      | null: false, uniqueness: true    |
| password           | string      | null: false,                     |

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
| rate          | float      | null: false                    |
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


