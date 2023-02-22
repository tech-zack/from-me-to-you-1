# README

## 思いよ届け from me to you

## アプリケーション概要


## 使用言語
・Ruby
・Ruby on Rails
・JavaScript
・HTML/CSS

## デプロイ後のURL

## テスト用のアカウント

## DEMO

## 利用方法


## 目指した課題解決
「誹謗中傷」を無くしたい。自分の人生に自信を持ってもらいたい。

## 洗い出した要件
・自分の人生の思い出を相手の人生に活かしてほしい


## users テーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | ----------------------- |
| email              | string |  NOT NULL unique :true  |
| encrypted_password | string |  NOT NULL               |
| nickname           | string |  NOT NULL               |
| image              | string |  NOT NULL               |

### Association
- has_many :posts, dependent: :destroy 
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :favorites, dependent: :destroy
- has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
- has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
- has_many :followings, through: :relationships, source: :followed
- has_many :followers, through: :reverse_of_relationships, source: :follower
- has_many :room_users, dependent: :destroy
- has_many :messages, dependent: :destroy

## libraries テーブル

| Column      | Type          | Options             |
| ----------- | ------------- | ------------------- |  

### Association

## posts テーブル

| Column      | Type          | Options             |
| ----------- | ------------- | ------------------- |
| title       | string        |  NOT NULL           |
| text        | text          |  NOT NULL           |
| image       | ActiveStorage | foreigen_key:true   |
| user_id     | references    | foreigen_key:true   |
| category_id | interger      |  NOT NULL           |

### Association

- belongs_to :user
- belongs_to :category
- has_one_attached :image
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :favorites , dependent: :destroy

## comments テーブル

| Column        | Type        | Options           |
| ------------- | ----------- | ----------------- |
| text          | comment     | NOT NULL                 |
| user_id       | references  | foreigen_key:true |
| post_id       | references  | foreigen_key:true |

### Association

- belongs_to :user
- belongs_to :post
  
## messages テーブル

| Column        | Type        | Options           |
| ------------- | ----------- | ----------------- |
| text          | message     | NOT NULL                 |
| user_id       | references  | foreigen_key:true |
| room_id       | references  | foreigen_key:true |

### Association

- belongs_to :room
- belongs_to :user
  
## likes テーブル

| Column      | Type          | Options             |
| ----------- | ------------- | ------------------- |
| user_id     | references    |  NOT NULL           |
| post_id     | references    |  NOT NULL           |

### Association

- belongs_to :user
- belongs_to :post

## favorites テーブル

| Column      | Type          | Options             |
| ----------- | ------------- | ------------------- |
| user_id     | references    |  NOT NULL           |
| post_id     | references    |  NOT NULL           |

### Association

- belongs_to :user
- belongs_to :post

## relationships テーブル

| Column           | Type      | Options             |
| --------------- | ---------- | ------------------- |
| follower_id     | integer    |                     |
| followerd_id    | integer    |                     |

### Association

- belongs_to :follower
- belongs_to :followerd

## room_uses テーブル

| Column      | Type          | Options             |
| ----------- | ------------- | ------------------- |
| user_id     | references    | foreigen_key:true   |
| room_id     | references    | foreigen_key:true   |

### Association

- belongs_to :user
- belongs_to :room

## room テーブル

| Column      | Type          | Options             |
| ----------- | ------------- | ------------------- |

### Association

- has_many :room_users
- has_many :messages