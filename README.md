# README

# テーブル設計

## users テーブル

| Column                | Type    | Options     |
| --------------------- | ------  | ----------- |
| nickname              | string  | null: false | ニックネーム
| last_name             | string  | null: false | 苗字
| first_name            | string  | null: false | 名前
| last_kana             | string  | null: false | 苗字(カナ)
| first_kana            | string  | null: false | 名前(カナ)
| email                 | text    | null: false | e-mail
| password              | text    | null: false | パスワード
| password_confirmation | text    | null: false | パスワード(確認)
| dob                   | date    | null: false | 生年月日

### Association
- has_many :items
- has_many :messages
- has_many :orders


## items テーブル

| Column          | Type       | Options                        |
| ----------------| -----------| ------------------------------ |
| name            | string     | null: false                    | 商品名
| product_image   | string     | null: false                    | 商品画像
| description     | text       | null: false                    | 商品の説明
| category        | integer    | null: false                    | カテゴリー Active_hash
| condition       | integer    | null: false                    | 商品の状態 Active_hash
| fee             | integer    | null: false                    | 配送料 Active_hash
| sending_area    | integer    | null: false                    | 発送元の地域 Active_hash
| delivery_time   | integer    | null: false                    | 発送までの日数 Active_hash
| price           | integer    | null: false                    | 価格
| user            | references | null: false, foreign_key: true | 出品者ID

### Association
- belongs_to :user
- has_many :messages
- has_one :address
- has_one :order

## addresses テーブル

| Column        | Type       | Options                        |
| --------------| ---------- | ------------------------------ |
| item          | references | null: false, foreign_key: true | 商品ID
| zip_code      | string     | null: false                    | 郵便番号
| prefecture    | integer    | null: false                    | 都道府県 Active_hash
| city          | string     | null: false                    | 市町村
| house_number  | string     | null: false                    | 番地
| building_name | string     |                                | 建物名
| phone_number  | string     | null: false                    | 電話番号

### Association
belongs_to :item

## messages テーブル

| Column  | Type       | Options                                     |
| ------- | ---------- | ------------------------------------------- |
| content | string     | null: false, foreign_key: true              | 商品ID
| user    | references | null: false, foreign_key: true              | ユーザーID
| comments| text       | null: false                                 | コメント

### Association
belongs_to :user
belongs_to :item

## orders テーブル

| Column    | Type       | Options                                     |
| --------- | ---------- | ------------------------------------------- |
| item      | references | null: false, foreign_key: true              | 商品ID
| user      | references | null: false, foreign_key: true              | 購入者

### Association
belongs_to :user
belongs_to :item