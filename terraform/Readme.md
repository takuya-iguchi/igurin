# Teraform

## ファイル構成
(1).[provide.tf] <br>
AWSへの接続情報(リージョン)、tfstate連携情報を記載

(2).[main.tf] <br>
作成するリソースを定義しているファイル

(3).[output.tf] <br>
リソース情報の出力するファイル
他ディレクトリへリソース情報を展開したい場合に利用

(4).[data.tf] <br>
terraform管理外のAWSリソースを取得するファイル

(5).[variable.tf] <br>
[main.tf]で定義している変数のデフォルト値を定義しているファイル

(6).[サービス名.tf] <br>
構築するサービスのパラメータを記載しているファイル
基本的には、こちらのファイルのパラメータを変更して構築を進める

## 全体構成
~~~
terraform
├── README.md
├── aws
|    └── template
|         ├── aurora.tf
|         ├── ec2.tf
|         ├── memcache.tf
|         ├── peer.tf
|         ├── redis.tf
|         ├── sg.tf
|         ├── vpc.tf
|         └── provider.tf
└── modules
    └── aws
         ├── aurora
         |    ├── data.tf
         |    ├── main.tf
         |    └── variable.tf
         ├── ec2
         |    ├── main.tf
         |    └── variable.tf
         ├── memcache
         |    ├── main.tf
         |    └── variable.tf
         ├── peering
         |    ├── data.tf
         |    ├── main.tf
         |    └── variable.tf
         ├── redis
         |    ├── main.tf
         |    └── variable.tf
         ├── sg
         |    ├── output.tf
         |    ├── main.tf
         |    └── variable.tf
         └── vpc
              ├── output.tf
              ├── main.tf
              └── variable.tf
~~~
