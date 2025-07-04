# README

This README would normally document whatever steps are necessary to get the
application up and running.

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

```mermaid
erDiagram
  USERS ||--o{ PROTOTYPES : has
  USERS ||--o{ COMMENTS : writes
  PROTOTYPES ||--o{ COMMENTS : receives

  USERS {
    string email "NOT NULL, ユニーク制約"
    string encrypted_password "NOT NULL"
    string name "NOT NULL"
    text profile "NOT NULL"
    text occupation "NOT NULL"
    text position "NOT NULL"
  }

  PROTOTYPES {
    string title "NOT NULL"
    text catch_copy "NOT NULL"
    text concept "NOT NULL"
    int user_id FK "references users, NOT NULL"
  }

  COMMENTS {
    text content "NOT NULL"
    int prototype_id FK "references prototypes, NOT NULL"
    int user_id FK "references users, NOT NULL"
  }

``` 