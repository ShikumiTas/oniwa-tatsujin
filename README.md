<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400" alt="Laravel Logo"></a></p>

<p align="center">
<a href="https://github.com/laravel/framework/actions"><img src="https://github.com/laravel/framework/workflows/tests/badge.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/dt/laravel/framework" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/v/laravel/framework" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/l/laravel/framework" alt="License"></a>
</p>

# README

## システムバージョン

- php: 8.3
- laravel: 11
- mysql: 8.0

## Docker

### システムの起動

```
$ docker-compose up -d
```

### システムの終了

```
$ docker-compose down
```

## ドキュメント

### API

docs/api/api.yml

### ERD

docs/table/erd.plantuml

## Seeder

### マスターデータの投入

```
$ ./vendor/bin/sail php artisan db:seed --class=QuestionSeeder
```

### シミュレーションの質問と回答の投入

```
$ ./vendor/bin/sail php artisan db:seed --class=MasterSeeder
```

### ユーザーLP　テストデータの投入

```
$ ./vendor/bin/sail php artisan db:seed --class=BisPartnerSeeder
```

### 上記のデータ一括投入

```
$ ./vendor/bin/sail php artisan db:seed --class=DatabaseSeeder
```