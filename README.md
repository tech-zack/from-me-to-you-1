# README

## 僕から君へ from me to you

## アプリケーション概要
自分の気持ちを投稿できるアプリケーションです。
<br>好きな風景や思い出、言葉などを投稿し相手と共有することができます。
<br>また、レスポンシブデザインに対応しており、タブレット・スマートフォンからも使用できます。

## 使用技術
・Ruby3.1.2
<br>・Ruby on Rails7.0.4
<br>・JavaScript
<br>・HTML/CSS
<br>・SQL
<br>・Git
<br>・Bootstrap5
<br>・AWS(VPC EC2 RDS S3 Route53 Internetgateway ELB)予定
<br>・Docker/Docker-compose(開発環境・本番環境)
<br>・Rspec

## インフラ構成図
<img width="549" alt="7723228b7b49d97e7b777665ca21eb8c" src="https://user-images.githubusercontent.com/78070415/224299480-1592ea7b-5a20-4c16-97ea-28d4a795042d.png">

## 機能一覧
・ユーザー登録、ログイン機能(devise)
    <br>○ユーザー編集機能
    <br>○プロフィール作成機能
    <br>○ユーザー削除機能
<br>・投稿機能
    <br>○画像投稿機能
    <br>○タイトル投稿機能
    <br>○テキスト投稿機能
    <br>○カテゴリー投稿機能
    <br>○投稿詳細機能
    <br>○投稿編集機能
    <br>○投稿削除機能
<br>・いいね機能(Hotwire・非同期)
    <br>○いいね数カウント機能
<br>・お気に入り機能(Hotwire・非同期)
    <br>○お気に入り数カウント機能
<br>・コメント機能(Hotwire・非同期)
    <br>○コメント投稿機能
    <br>○コメント数カウント機能
    <br>○コメント削除機能
<br>・ダイレクトメッセージ機能(ActionCable)(Hotwire・非同期)
<br>・フォロー機能(Hotwire・非同期)
<br>・フォロワー機能(Hotwire・非同期)
<br>・検索機能(ransack)
<br>・カテゴリー検索機能(ransack)
<br>・ページネーション機能(kaminari)(Hotwire・非同期)
<br>・今日の貴方へ機能(投稿機能ランダム)(Hotwire・非同期)
<br>・パンくずリスト(Hotwire・非同期)
<br>・マイページ機能

## デプロイ後のURL

## テスト用のアカウント

## DEMO

## 利用方法
1.アクセスするとトップページに遷移 

<br>2.「新規登録」をクリック  

<br>3.ログインページに遷移した上で、上記テスト用アカウントでログイン

<br>４.「閲覧室」をクリック。

<br>5.投稿されているコンテンツの「閲覧する」をクリックすると該当の詳細画面へ遷移
<br>ログイン中であればいいね機能・お気に入り機能・コメント機能を使用することができます。
<br>また、詳細ページの相手のアカウントのニックネームをクリックすることで相手のマイページに移動することが可能です。
<br>＊相手のマイページではフォロー機能・ダイレクトメッセージ機能を使用することができます
<br>＊なお、投稿にあっては「届ける」をクリックすることで投稿することが可能です。

<br>6.閲覧室、もしくはトップページの左上にある検索フォームにてタイトル検索することが可能です。
<br>また、閲覧室にある「カテゴリー検索」のフォームを使用することでカテゴリー検索が可能です。

<br>7.マイページにて「登録情報の更新」をクリックすることでプロフィールの編集また、ニックネーム・emailの変更・アカウントの削除が可能です。
<br>さらに、自分がフォローしているアカウント、フォロワー、自分が投稿した物、いいねを押した物、お気に入り登録したものを見ることができます。

<br>8.「ログアウト」をクリックすることでログアウトすることができます。
<br>なお、ログインしなくても、検索機能・カテゴリー検索・投稿の詳細画面・今日のあなたへの機能を使用することができます。
<br>＊いいね機能・お気に入り機能・コメント機能・フォロー機能・ダイレクトメッセージ機能は使用することはできません。
<br>また、詳細ページの相手のアカウントのニックネームをクリックしても相手のマイページに移動することはできません。

<br>9.「今日の貴方へ」とは、「今日のあなたへ」をクリックすることで、ランダムで気持ちがあなたに届きます。

## 目指した課題解決
コロナ禍で人間関係が希薄になっている現在。マスクについては自己判断になりましたが、それでもまだ、人間関係は以前のようなものには戻っていなく、どこか距離を感じます。
<br>このアプリケーションを利用することで、老若男女問わず、自分の気持ちを相手と共有することができ、以前のように他者と交流することができます。
<br>人生で出会える人の数は限られており、限りある時間の中で、できるだけ多くの人と触れ合い、人生をより良いものにしてほしいと考えました。

## 洗い出した要件
コロナ禍が収まりつつあるが、まだマスクや外に出ることに抵抗を覚えている人がおり、また、人間関係が以前のように円滑ではなくなった。
<br>以前のように外に出かけて人とマスクなしで話したい、触れ合いたいという人たちがいる。そういった人に触れ合う場所を作りたい。
<br>自分にとっての何気ない思いであっても相手の人生を変える力があり、そういった何気ない思いが集まることによってたくさんの人の人生に影響を与えたい。


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

