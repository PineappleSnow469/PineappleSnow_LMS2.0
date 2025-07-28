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

### プロジェクトの実行
以下のコマンドでコンテナをビルドし、バックグラウンドで実行します：
```bash
cd backend

mvn clean package

cd ..

docker-compose build

docker-compose up -d
```
注意：対象ポートが使用中の場合は、まず該当ポートで動作しているサービスを停止してください。

使用方法
プロジェクト起動後、以下のアドレスをブラウザで開くとシステムを使用できます：

http://localhost:9528/BookManager/#/

### 設定オプション

backend\src\main\resources\application.propertiesファイルの主な設定内容は以下の通りです：

```application.properties
# =============== SQL Server データベースの配置 ===============
spring.datasource.driver-class-name=com.microsoft.sqlserver.jdbc.SQLServerDriver
spring.datasource.url=${SPRING_DATASOURCE_URL:jdbc:sqlserver://localhost:1433;databaseName=book_manager;encrypt=true;trustServerCertificate=true}
spring.datasource.username=${SPRING_DATASOURCE_USERNAME:sa}
spring.datasource.password=${SPRING_DATASOURCE_PASSWORD:YourStrongPassw0rd@}
```

docker-compose.ymlファイルの主な設定内容は以下の通りです：

```yaml
sqlserver:
    image: mcr.microsoft.com/mssql/server:2022-latest  
    container_name: sqlserver
    restart: always
    environment:
      ACCEPT_EULA: Y
      SA_PASSWORD: "YourStrongPassw0rd@"
      MSSQL_PID: Express  
    ports:
      - "1433:1433"
    volumes:
      - sqlserver-data:/var/opt/mssql
      - ./init-sql:/docker-entrypoint-initdb.d
    networks:
      - app-network
    healthcheck:  
      test: ["CMD-SHELL", "/opt/mssql-tools/bin/sqlcmd -U sa -P $$SA_PASSWORD -Q 'SELECT 1' || exit 1"]
      interval: 10s
      timeout: 5s
      retries: 10
  ...
 backend:
    build: ./backend
    container_name: backend
    depends_on:
      - sqlserver
      - redis 
    ports:
      - "8092:8092"
    environment:
      SPRING_DATASOURCE_URL: jdbc:sqlserver://sqlserver:1433;databaseName=book_manager;encrypt=true;trustServerCertificate=true
      SPRING_DATASOURCE_USERNAME: sa
      SPRING_DATASOURCE_PASSWORD: YourStrongPassw0rd@
```
注意事項
すべての環境依存関係が正しくインストールされていることを確認してください

データベースパスワードなどの機密情報には、サンプルの"YourStrongPassw0rd@"を直接使用しないでください

データベースの自動初期化に失敗する場合、powershellで手動で初期化してください：
```powershell
docker cp init.sqlの絶対パス sqlserver:/tmp/init.sql

#/opt/mssql-tools18/bin/sqlcmdは自分のsqlcmdのパス
docker exec -it sqlserver /opt/mssql-tools18/bin/sqlcmd ` -S localhost -U SA -P "YourStrongPassw0rd@" -C -i /tmp/init.sql -o /tmp/output.txt -r

docker exec -it sqlserver cat /tmp/output.txt
```