図書館管理システム
markdown
 VSCodedeCtrl+Shift+Vでプレビューモードに切り替える
# 図書館管理システム

## プロジェクト概要
このシステムは図書館の蔵書リソースを管理するためのもので、包括的な図書管理ソリューションを提供します。

## 目次
1. [機能特徴](#機能特徴)
2. [インストールガイド](#インストールガイド)
3. [使用方法](#使用方法)
4. [設定オプション](#設定オプション)

## 機能特徴
1. **ユーザー階層管理**：ユーザーレベルに応じて異なる権限を付与、レベルが高いほど権限が大きくなります
2. **図書管理**：図書の登録、削除、更新、検索などの完全な管理機能を提供

## インストールガイド

### 環境要件
- **バックエンド環境**：
  - JDK 8+
  - Maven 3.6+
  - VS Code（Java拡張機能が必要）
  
- **フロントエンド環境**：
  - Node.js 22.17.0
  - npm 10.9.2
  - VS Code（Vueプラグインのインストール推奨）
  - Vue CLI 5.x
  
- **コンテナ環境**：
  - Docker 28.3.0

### インストール手順
1. **リポジトリのクローン**：リポジトリからプロジェクトをローカルにクローン
2. **依存関係のインストール**：プロジェクトに必要なすべての依存関係をインストール
3. **データベースの初期化**：
   - 手順1：Docker上でMySQLコンテナを設定
   - 手順2：MySQLコンテナ内に`book_manager`という名前のデータベースを作成
   - 手順3：`book_manager.sql`ファイルを使用してデータベース構造を初期化

### プロジェクトの実行
以下のコマンドでコンテナをビルドし、バックグラウンドで実行します：
```bash
docker-compose up -d
注意：対象ポートが使用中の場合は、まず該当ポートで動作しているサービスを停止してください。

使用方法
プロジェクト起動後、以下のアドレスをブラウザで開くとシステムを使用できます：

http://localhost:9528/BookManager/#/

設定オプション
docker-compose.ymlファイルの主な設定内容は以下の通りです：

yaml
mysql:
  image: mysql:8.0
  container_name: mysql
  restart: always
  environment:
    MYSQL_ROOT_PASSWORD: yourpassword
    MYSQL_DATABASE: book_manager
  ports:
    - "3306:3306"
  volumes:
    - mysql-data:/var/lib/mysql
  networks:
    - app-network

backend:
  build: ./backend
  container_name: backend
  depends_on:
    - mysql
    - redis
  ports:
    - "8092:8092"
  environment:
    SPRING_DATASOURCE_URL: jdbc:mysql://mysql:3306/book_manager?useAffectedRows=true&serverTimezone=Asia/Shanghai
    SPRING_DATASOURCE_USERNAME: root
    SPRING_DATASOURCE_PASSWORD: yourpassword
注意事項
すべての環境依存関係が正しくインストールされていることを確認してください

データベースパスワードなどの機密情報には、サンプルの"yourpassword"を直接使用しないでください

初回実行時は、イメージのビルドとデータベースの初期化に時間がかかる場合があります