# README

## 僕から君へ from me to you

## アプリケーション概要
・自分の気持ちを投稿できるアプリケーションです。

・好きな風景や思い出、言葉などを投稿し相手と共有することができます。

・また、レスポンシブデザインに対応しており、タブレット・スマートフォンからも使用できます。

## 使用技術
・Ruby3.1.2

・Ruby on Rails7.0.4

・JavaScript

・HTML/CSS

・SQL

・Git

・Bootstrap5

・AWS(VPC EC2 RDS S3 Route53 Internetgateway ELB)予定

・Docker/Docker-compose(開発環境・本番環境)

・Rspec

## 機能一覧
- ユーザー登録、ログイン機能(devise)
    - ユーザー編集機能
    - プロフィール作成機能
    - ユーザー削除機能
- 投稿機能
    - 画像投稿機能
    - タイトル投稿機能
    - テキスト投稿機能
    - カテゴリー投稿機能
    - 投稿詳細機能
    - 投稿編集機能
    - 投稿削除機能
- いいね機能(Hotwire・非同期)
    - いいね数カウント機能
- お気に入り機能(Hotwire・非同期)
    - お気に入り数カウント機能
- コメント機能(Hotwire・非同期)
    - コメント投稿機能
    - コメント数カウント機能
    - コメント削除機能
- ダイレクトメッセージ機能(ActionCable)(Hotwire・非同期)
- フォロー機能(Hotwire・非同期)
- フォロワー機能(Hotwire・非同期)
- 検索機能(ransack)
- カテゴリー検索機能(ransack)
- ページネーション機能(kaminari)(Hotwire・非同期)
- 今日のあなたへ機能(投稿機能ランダム)(Hotwire・非同期)
- パンくずリスト(Hotwire・非同期)
- マイページ機能

## デプロイ後のURL

## テスト用のアカウント

## DEMO

## 利用方法
1.アクセスするとトップページに遷移 

2.「新規登録」をクリック  

3.ログインページに遷移した上で、上記テスト用アカウントでログイン

４.「閲覧室」をクリック。

5.投稿されているコンテンツの「閲覧する」をクリックすると該当の詳細画面へ遷移
ログイン中であればいいね機能・お気に入り機能・コメント機能を使用することができます。
また、詳細ページの相手のアカウントのニックネームをクリックすることで相手のマイページに移動することが可能です。

＊ 相手のマイページではフォロー機能・ダイレクトメッセージ機能を使用することができます

＊ なお、投稿にあっては「届ける」をクリックすることで投稿することが可能です。

6.閲覧室、もしくはトップページの左上にある検索フォームにてタイトル検索することが可能です。
また、閲覧室にある「カテゴリー検索」のフォームを使用することでカテゴリー検索が可能です。

7.マイページにて「登録情報の更新」をクリックすることでプロフィールの編集また、ニックネーム・emailの変更・アカウントの削除が可能です。
さらに、自分がフォローしているアカウント、フォロワー、自分が投稿した物、いいねを押した物、お気に入り登録したものを見ることができます。

8.「ログアウト」をクリックすることでログアウトすることができます。
なお、ログインしなくても、検索機能・カテゴリー検索・投稿の詳細画面・今日のあなたへの機能を使用することができます。

＊ いいね機能・お気に入り機能・コメント機能・フォロー機能・ダイレクトメッセージ機能は使用することはできません。

また、詳細ページの相手のアカウントのニックネームをクリックしても相手のマイページに移動することはできません。

9.「今日の貴方へ」とは、「今日のあなたへ」をクリックすることで、ランダムで気持ちがあなたに届きます。

## 目指した課題解決
コロナ禍で人間関係が希薄になっている現在。マスクについては自己判断になりましたが、それでもまだ、人間関係は以前のようなものには戻っていなく、どこか距離を感じます。

このアプリケーションを利用することで、老若男女問わず、自分の気持ちを相手と共有することができ、以前のように他者と交流することができます。

人生で出会える人の数は限られており、限りある時間の中で、できるだけ多くの人と触れ合い、人生をより良いものにしてほしいと考えました。

## 洗い出した要件
コロナ禍が収まりつつあるが、まだマスクや外に出ることに抵抗を覚えている人がおり、また、人間関係が以前のように円滑ではなくなった。

以前のように外に出かけて人とマスクなしで話したい、触れ合いたいという人たちがいる。そういった人に触れ合う場所を作りたい。

自分にとっての何気ない思いであっても相手の人生を変える力があり、そういった何気ない思いが集まることによってたくさんの人の人生に影響を与えたい。

## インフラ構成図
<img width="839" alt="インフラ構成図" src="https://user-images.githubusercontent.com/78070415/224886078-070492e8-8906-4466-8993-a4e92f8508cb.png">

## ER図
<img width="453" alt="ER図" src="https://user-images.githubusercontent.com/78070415/224886237-7874e40e-3412-478c-99fd-80926a926658.png">

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
| id          |               |                     |
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
| id          |               |                     |
### Association

- has_many :room_users
- has_many :messages