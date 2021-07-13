# テーブル設計

## usersテーブル
| Columns            | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name2         | string  | null: false |
| first_name2        | string  | null: false |
| birth_year         | integer | null: false |
| birth_month        | integer | null: false |
| birth_day          | integer | null: false |

### Association
- has_many :items
- has_many :purchases

## itemsテーブル
| Columns            | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| shipping_area_id   | integer    | null: false                    |
| price              | integer    | null: false                    |
| days_to_ship_id    | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase

## purchasesテーブル
| Columns          | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| card_number      | integer    | null: false                    |
| expiration_month | integer    | null: false                    |
| expiration_date  | integer    | null: false                    |
| csv              | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addressesテーブル
| Columns       | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefectures   | string     | null: false                    |
| municipality  | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phon_number   | integer    | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase