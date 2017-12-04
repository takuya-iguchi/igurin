# Teraform
## ファイル構成
(1).[provide.tf] <br>
AWSへの接続情報を記載したファイル(アクセスキー、シークレットキー、リージョン)

(2).[setting.tf],[setting_〇〇.tf],[〇〇_setting.tf] <br>
読み込むディレクトリの指定、動的なパラメータの設定を記載しているファイル
基本的には、こちらのファイルを編集して構成の管理を実施していく。

(3).[main.tf] <br>
作成するリソースを定義しているファイル

(4).[output.tf] <br>
作成したリソース情報の出力するファイル
他ディレクトリへ作成したリソース情報を展開したい場合に利用

(5).[data.tf] <br>
terraform管理外のAWSリソースを取得するファイル
Amazon Linux最新のAMIを取得してEC2を作成する等に利用

## 全体構成
~~~
terraform
├── README.md
├── read_resouce.tf
├── provider.tf
├── aws
|    ├── all
|    |    └── vpc.tf
|    ├── other
|    |    ├── ec2.tf
|    |    ├── sg.tf
|    |    ├── redis.tf
|    |    ├── variable.tf
|    |    └── vpc.tf
|    ├── prd
|    |    ├── aurora.tf
|    |    ├── ec2.tf
|    |    ├── sg.tf
|    |    ├── redis.tf
|    |    ├── variable.tf
|    |    └── vpc.tf
|    └── stg
|         ├── aurora.tf
|         ├── ec2.tf
|         ├── sg.tf
|         ├── redis.tf
|         ├── variable.tf
|         └── vpc.tf
└── modules
    └── aws
         ├── all
         |    └── vpc
         |         ├── main.tf
         |         ├── output.tf
         |         └── variable.tf
         ├── other
         |     ├── aurora
         |     |     ├── main.tf
         |     |     └── variable.tf
         |     ├── ec2
         |     |    ├── main.tf
         |     |    └── variable.tf
         |     ├── redis
         |     |    ├── main.tf
         |     |    └── variable.tf
         |     ├── sg
         |     |    ├── main.tf
         |     |    ├── output.tf
         |     |    └── variable.tf
         |     └── vpc
         |          ├── main.tf
         |          ├── output.tf
         |          └── variable.tf
         ├── prd
         |    ├── aurora
         |    |     ├── main.tf
         |    |     └── variable.tf
         |    ├── ec2
         |    |    ├── main.tf
         |    |    └── variable.tf
         |    ├── redis
         |    |    ├── main.tf
         |    |    └── variable.tf
         |    ├── sg
         |    |    ├── main.tf
         |    |    ├── output.tf
         |    |    └── variable.tf
         |    └── vpc
         |         ├── main.tf
         |         ├── output.tf
         |         └── variable.tf
         └── stg
              ├── aurora
              |     ├── main.tf
              |     └── variable.tf
              ├── ec2
              |    ├── main.tf
              |    └── variable.tf
              ├── redis
              |    ├── main.tf
              |    └── variable.tf
              ├── sg
              |    ├── main.tf
              |    ├── output.tf
              |    └── variable.tf
              └── vpc
                   ├── main.tf
                   ├── output.tf
                   └── variable.tf
~~~
