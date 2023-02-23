# README

## 思いよ届け from me to you

## アプリケーション概要
たくさんの思いをたくさんの人と共有するアプリケーションです。
人間が亡くなるときに最後まで残っているの感覚は聴覚だと言われています。亡くなる寸前に例え目が見えなくても言葉を伝えることで「思い」を相手に届けることができます。
また、悲しいことに現在世の中には「誹謗中傷」といった今まで聞かれてこなかったような言葉が生まれてしまいました。

このアプリケーションの目的は以下の2つです。

1,たくさんの思いをたくさんの人に届けあい、互いの人生をより豊かにする

2,「誹謗中傷」という言葉をこの世から撲滅する。

## 使用言語
・Ruby
・Ruby on Rails
・JavaScript
・HTML/CSS
・SQL
・Git
・Bootstrap5

## デプロイ後のURL

## テスト用のアカウント

## DEMO

## 利用方法
1.アクセスするとトップページに遷移 

2.「新規登録」をクリック  

3.ログインページに遷移した上で、上記テスト用アカウントでログイン

４.投稿されているコンテンツをクリックすると該当の詳細画面へ遷移
ログイン中であればいいね機能・お気に入り機能・コメント機能・を使用することができます。
＊なお、投稿にあっては「届ける」をクリックすることで投稿することが可能です。

5.閲覧室、もしくはトップページの左上にある検索フォームにてタイトル検索することが可能です。
また、閲覧室にある「カテゴリー検索」のフォームを使用することでカテゴリー検索が可能です。

6.マイページにて、プロフィールの編集また、ニックネーム・emailの変更・アカウントの削除が可能です。
また、相手のアカウントのニックネームをクリックすることで相手のマイページに移動することが可能です。
＊相手のマイページではフォロー機能・メッセージ機能を使用することができます

７.「ログアウト」をクリックすることでログアウト機能を使用できます
なお、ログインしなくても、検索機能・カテゴリー検索・投稿の詳細画面・あなたへの１枚機能を使用することができます。
＊いいね機能・お気に入り機能・コメント機能・フォロー機能・メッセージ機能は使用することはできません。

8.「あなたへの1枚機能」とは、「あなたへの1枚」をクリックすることで、ランダムで思いがあなたに届きます。

## 目指した課題解決
「誹謗中傷」を無くしたい。
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