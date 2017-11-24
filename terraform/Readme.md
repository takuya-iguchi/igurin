## 概要

## 基本構成
(1).[〇〇.tf] <br>
Terraformで実行されるファイル <br>
同日ディレクトリ内に複数のファイルがある場合は同時に全て実行される

(2).[terraform.tfstate] <br>
Terraformレシピを実行した結果が記載されているファイル

(3).[variable.tf] <br>
デフォルトで読み込まれる変数ファイル

(4).[.terraform] <br>
プロバイダーへ接続するためのプラグイン保存場所

## terraformインストール・設定(Linux)
    #wget https://releases.hashicorp.com/terraform/0.11.0/terraform_0.11.0_linux_amd64.zip
    #unzip terraform_0.11.0_linux_amd64.zip
    #rm terraform_0.11.0_linux_amd64.zip
    #mkdir /usr/local/terrarom/bin
    #mv terrarom /usr/local/terrarom/bin/
    #export PATH=$PATH:/usr/local/terrarom/bin/
    #terraform -v

## terraformインストール・設定(Windows)
(1).公式サイトより最新のterraformをダウンロード <br>
(2).ダウンロードしたterraformファイルを解凍 <br>
(3).解凍したファイルをC:\Users\個人ディレクトリに保存 <br>
(4).Windowsの「Path」にterraformのパスを登録 <br>
(5).コマンドプロンプトより`terraform -v`を実行 <br>

## terraformの実行
    #terraform init
    #terraform plan
    #terraform apply
    #terraform show
    #terraform plan -destroy
    #terraform destroy

## コマンドオプション
|オプション|説明|
|:--|:--|
|apply|構築、変更|
|console|対話式のコンソール|
|destroy|構築したものを削除|
|env|ワークスペースを管理|
|fmt|設定ファイルを標準形式に書き換え|
|graph|リソースのビジュアルグラフを表示|
|import|既存の環境をterraform管理は以下に置く|
|init|作業ディレクトリの初期化|
|output||
|plan|実行計画を生成して表示|
|providers|プロバイダのツリーを表示|
|push|Atlasへの連携|
|refresh|実環境と比較してリソース状態ファイルを更新|
|show|Terraformの状態、経過を表示|
|taint|汚れているリソースを手動で明確化する|
|untaint|明確化されたリソースを元に戻す|
|validate|設定ファイルの検証|
|version|バージョン確認|
|workspace|ワークスペースの管理|
|debug|デバッグ|
|force-unlock|テラフォームの状態解除|
|state|状態確認|

## 参考サイト
|タイトル|サイト|
|:--|:--|
|Terraform公式|https://www.terraform.io/|
|AWS関連の設定ドキュメント|https://www.terraform.io/docs/providers/aws/index.html|
|各モジュール設定ドキュメント|https://registry.terraform.io/|
|Terraformの開発github|https://github.com/hashicorp/terraform|
|Terraformのベストプラクティス|https://github.com/hashicorp/best-practices|
|各モジュールのテンプレート|https://github.com/terraform-community-modules|
