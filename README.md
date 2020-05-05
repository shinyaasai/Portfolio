# アプリケーションの概要

毎日の睡眠時間や日常の気分を記録するサービスです。
平均睡眠時間によって表示されるキャラクターが変わる、
投稿した夢の記録を他のユーザーと共有出来るなどユーザーが
楽しみながら記録を付けることを意識して作成しました。


# アプリケーションの機能

* 睡眠時間や日々の気分をウィザード形式で入力

* 過去の記録内容を検索

* 今週の平均睡眠時間の表示

* 記録回数や睡眠時間により表示画像の切り替え

* 夢の記録を任意で投稿

* 投稿された夢の記録の閲覧

* コメント

* ログイン

* モデルに対するバリデーション

# 作成した背景

父が通院する病院に毎日の睡眠時間や薬の使用履歴を
報告しており毎日メモを取っていた為、簡単に記録し
閲覧出来ればと思い作成しました。
初期段階では記録を入力し閲覧が出来るシンプルなものでしたが、
父に使用してもらいながら意見をもらい
ストレスなく記録を取ることが出来るかつ
毎日の記録が楽しくなることが課題となり
現在の仕様に至りました。

# 環境

* フレームワーク
  - Ruby on Rails

* インフラ
  - AWS EC2

* データベース
  - AWS RDS MySQL

* アプリケーションサーバー
   - Unicorn

* Webサーバー
   - Nginx
