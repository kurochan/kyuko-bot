kyuko-bot
=========

大学の休講情報等を自動でつぶやくために作ったbotです。  
mailgun等の受信したメールをPOSTとして送信してくれるWebサービスと連携し、休講等の連絡メールを受信した際に本文をTwitterに投稿します。

## 設置方法
config.rb.sampleをconfig.rbにリネームし、設定を書き換えてください。  
Heroku等にデプロイすれば動作します。
