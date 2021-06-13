# テーブル設計

## users テーブル

| Column          | Type    | Options        |
| --------------- | ------- | -------------- |
| nickname        | string  | null: false    |
| email           | string  | null: false    |
| password        | string  | null: false    |
| birthday        | date    |                |
| baseball_career | integer |                |
| appeal          | text    |                |
| is_manager      | boolean | default: false |

### Association
- has_many: posts
- has_one: team
- has_many :room_users
- has_many :rooms, through: room_users
- has_many :messages

## teams テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| team_name          | string  | null: false |
| prefecture_code_id | integer | null: false |
| city               | string  |             |
| team_introduction  | text    |             |

### Association
- belongs_to: user

## postsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| title              | string     | null: false                    |
| match_date         | date       | null: false                    |
| match_site         | string     | null: false                    |
| prefecture_code_id | integer    | null: false                    |
| recruit_count      | integer    | null: false                    |
| content            | text       | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to: user

## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :room_users
- has_many :users, through: room_users
- has_many :messages

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user
