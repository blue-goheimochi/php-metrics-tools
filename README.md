# php-metrics-tools

既存の環境を汚さずに各種ツールを実行してみる用のコンテナが作成できます。

以下のツールでコードメトリクスの取得が可能です。

- phpcpd
- lizard
- churn-php
- phpmd
- phpstan
- rector
- phpmetrics
- composer-unused
- phpmnd
- phpcs
- php-cs-fixer
- phpinsights

## コンテナのビルド

```shell
make build
```

## 各ツールの実行

### 1. 計測対象のディレクトリの指定

```shell
export TARGET_DIR=/Path/To/Target/Dir
```

計測したいディレクトリのパスを環境変数に設定します。  
`composer.json`のファイル、 `vendor` ディレクトリが配置されているディレクトリを指定するとよいです。

### 2. 各ツールの実行

#### phpcpd

https://github.com/sebastianbergmann/phpcpd

```shell
make phpcpd
```

#### lizard

https://github.com/terryyin/lizard

```shell
make lizard
```

#### churn-php

https://github.com/bmitch/churn-php

```shell
make churn
```

#### phpmd

https://phpmd.org/

```shell
make phpmd
```

#### PHPStan

https://github.com/phpstan/phpstan

```shell
make phpstan
```

#### Rector

https://github.com/rectorphp/rector

```shell
make rector
```

#### PhpMetrics

https://phpmetrics.github.io/website/

```shell
make phpmetrics
```

`phpmetrics-report` ディレクトリにHTMLファイルが出力されるので `index.html` をブラウザで開いて確認できます。

#### composer-unused

https://github.com/composer-unused/composer-unused

```shell
make composer-unused
```

#### PHP Magic Number Detector (PHPMND)

https://github.com/povils/phpmnd

```shell
make phpmnd
```

#### PHP_CodeSniffer

https://github.com/squizlabs/PHP_CodeSniffer

```shell
make phpcs
```

#### PHP CS Fixer

https://github.com/PHP-CS-Fixer/PHP-CS-Fixer

```shell
make php-cs-fixer
```

#### PHP Insights

https://phpinsights.com/

```shell
make phpinsights
```
