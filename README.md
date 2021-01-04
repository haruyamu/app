## users

| column   | type   | options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :posts
- has_many :comments
- has_many :books

## posts

| column  | type       | options                       |
| ------- | ---------- | ----------------------------- |
| title   | string     | null: false                   |
| place   | string     | null: false                   |
| content | text       | null: false                   |
| user    | references | null: false,foreign_key; true |

### Association

-belongs_to :user
has_many :comments
has_many :books
has_many :likes

## books

| column | type       | options                       |
| ------ | ---------- | ----------------------------- |
| user   | references | null: false,foreign_key; true |
| post   | references | null: false,foreign_key; true |

### Association

-belongs_to :user
-belongs_to :post

## like

| column | type       | options                       |
| ------ | ---------- | ----------------------------- |
| user   | references | null: false,foreign_key; true |
| post   | references | null: false,foreign_key; true |

### Association

-belongs_to :user
-belongs_to :post

## comments

| column | type       | options                       |
| ------ | ---------- | ----------------------------- |
| text   | text       | null: false                   |
| user   | references | null: false,foreign_key; true |
| post   | references | null: false,foreign_key; true |

### Association

-belongs_to :user
-belongs_to :post
