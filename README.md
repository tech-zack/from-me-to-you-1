# README

## 僕から君へ from me to you

## アプリケーション概要
人々の思いを投稿できるアプリケーションです。
好きな言葉や思い出、言葉などを相手と共有できます。
また、レスポンシブデザインに対応しており、タブレット・スマートフォンからも使用できます。

このアプリケーションの目的は以下の2点です。

1,たくさんの思いをたくさんの人に届けあい、互いの人生をより豊かにする。

2,「誹謗中傷」という言葉をこの世からなくす。

## 使用技術
・Ruby3.1.2
・Ruby on Rails7.0.4
・JavaScript
・HTML/CSS
・SQL
・Git
・Bootstrap5
・AWS(VPC EC2 RDS S3 Route53 Internetgateway ELB)予定
・Docker/Docker-compose
・Rspec

## インフラ構成図
<img width="549" alt="7723228b7b49d97e7b777665ca21eb8c" src="https://user-images.githubusercontent.com/78070415/224299480-1592ea7b-5a20-4c16-97ea-28d4a795042d.png">

## 機能一覧
・ユーザー登録、ログイン機能(devise)
    ○ユーザー編集機能
    ○プロフィール作成機能
    ○ユーザー削除機能
・投稿機能
    ○画像投稿機能
    ○タイトル投稿機能
    ○テキスト投稿機能
    ○カテゴリー投稿機能
    ○投稿詳細機能
    ○投稿編集機能
    ○投稿削除機能
・いいね機能(Hotwire・非同期)
    ○いいね数カウント機能
・お気に入り機能(Hotwire・非同期)
    ○お気に入り数カウント機能
・コメント機能(Hotwire・非同期)
    ○コメント数カウント機能
    ○コメント削除機能
・ダイレクトメッセージ機能(ActionCable)(Hotwire・非同期)
・フォロー機能
・フォロワー機能
・検索機能(ransack)
・カテゴリー検索機能(ransack)
・ページネーション機能(kaminari)(Hotwire・非同期)
・今日の貴方へ機能(投稿機能ランダム)(Hotwire・非同期)
・パンくずリスト
・マイページ機能

## デプロイ後のURL

## テスト用のアカウント

## DEMO

## 利用方法
1.アクセスするとトップページに遷移 

2.「新規登録」をクリック  

3.ログインページに遷移した上で、上記テスト用アカウントでログイン

４.投稿されているコンテンツをクリックすると該当の詳細画面へ遷移
ログイン中であればいいね機能・お気に入り機能・コメント機能を使用することができます。
＊なお、投稿にあっては「届ける」をクリックすることで投稿することが可能です。

5.閲覧室、もしくはトップページの左上にある検索フォームにてタイトル検索することが可能です。
また、閲覧室にある「カテゴリー検索」のフォームを使用することでカテゴリー検索が可能です。

6.マイページにて、プロフィールの編集また、ニックネーム・emailの変更・アカウントの削除が可能です。
また、相手のアカウントのニックネームをクリックすることで相手のマイページに移動することが可能です。
＊相手のマイページではフォロー機能・ダイレクトメッセージ機能を使用することができます

７.「ログアウト」をクリックすることでログアウト機能を使用できます
なお、ログインしなくても、検索機能・カテゴリー検索・投稿の詳細画面・今日の貴方へ機能を使用することができます。
＊いいね機能・お気に入り機能・コメント機能・フォロー機能・ダイレクトメッセージ機能は使用することはできません。

8.「今日の貴方へ」とは、「今日の貴方へ」をクリックすることで、ランダムで思いがあなたに届きます。

## 目指した課題解決
「誹謗中傷」を無くしたい。思いで攻撃するのではなく、思いで人を助けられる人間になる。
このアプリケーションを利用することで、老若男女問わず、自分の思いを相手と共有することができる。人生において会える人の数も限られており、たくさんの人の思いを知ることで自分の人生、相手の人生に良い影響を与えることができる。

## 洗い出した要件
自分の思いを「誹謗中傷」といった、相手を攻撃するために使うのではなく、相手の幸せを願うことに使ってほしい。
自分にとっての何気ない思いであっても相手の人生を変える力があり、そういった何気ない思いが集まることによってたくさんの人の人生に影響を与えたい。


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
| comment       | text        | NOT NULL          |
| user_id       | references  | foreigen_key:true |
| post_id       | references  | foreigen_key:true |

### Association

- belongs_to :user
- belongs_to :post
  
## messages テーブル

| Column        | Type        | Options           |
| ------------- | ----------- | ----------------- |
| message       | text        | NOT NULL          |
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

###　ER図
<img width="301" alt="02995274849820b05202cd986fbc5221" src="https://user-images.githubusercontent.com/78070415/224298683-242cb719-b3dc-45ad-866b-ae5a55190080.png">

