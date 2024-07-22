# نظام إدارة المبيعات الصغيرة | Mini Sales Management System

* [Arabic](#arabic) | [English](#english)

## Arabic

هذا مشروع Ruby on Rails يمكّنك من إدارة المبيعات اليومية، وإنشاء الفواتير مع البنود، وإدارة المنتجات مع الأسعار، وإدارة الموردين، وإدارة المستخدمين مع الأدوار (مسؤول أو لا).

## إصدار روبي
يستخدم هذا المشروع إصدار روبي `3.2.2`.

## متطلبات النظام
يتطلب هذا المشروع المتطلبات النظامية التالية:
- `ruby "3.2.2"` -> https://www.ruby-lang.org/en/downloads/
- `rails`, `~> 7.1.3`, `>= 7.1.3.4` -> https://guides.rubyonrails.org/v5.0/getting_started.html
- `pg`, `~> 1.1` -> https://www.postgresql.org/download/


## التثبيت
 ١ - قم بنسخ وتحميل المشروع من ال GitHub بإستخدام الأمر التالي  ->
```
git clone git@github.com:Adel-Saleh96/mini-sales-management.git
```

٢ - انتقل إلي مجلد المشروع :

```
cd mini-sales-management
```

٣ - قم بتثبيت المكتبات اللازمة :

```
bundle install
```

٤ - قم بإعداد قاعدة البيانات :
```
rails db:create db:migrate db:seed

```

٥ - قم بتشغيل خادم Rails:

```
rails s
```

٦ - قم بفتح المتصفح وقم بزيارة http://localhost:3000 للوصول إلى النظام.

## الميزات
يتضمن نظام إدارة المبيعات الصغيرة الميزات التالية:

1. **إدارة المبيعات اليومية**: يمكن للمستخدمين إضافة وتحرير وعرض سجلات المبيعات اليومية.
2. **إنشاء الفواتير**: يمكن للمستخدمين إنشاء الفواتير مع البنود، وعرض وتحرير الفواتير الموجودة.
3. **إدارة المنتجات**: يمكن للمستخدمين إضافة وتحرير وعرض المنتجات مع الأسعار.
4. **إدارة الموردين**: يمكن للمستخدمين إضافة وتحرير وعرض الموردين.
5. **إدارة المستخدمين**: يمكن تعيين أدوار للمستخدمين (مسؤول أو لا) ويمكن إدارة وصولهم وفقًا لذلك.
6. **لوحة التحكم الإدارية**: تُوفر لوحة التحكم الإدارية، والتي يدعمها `administrate`، واجهة مركزية لإدارة جميع جوانب النظام.
7. **مصادقة المستخدم**: يستخدم `devise` للمصادقة على المستخدم وإدارته.

## English

# Mini Sales Management System

This is a Ruby on Rails project that enables you to manage daily sales, create invoices with items, manage products with prices, manage suppliers, and manage users with roles (admin or not).

## Ruby Version
This project uses Ruby version `3.2.2`.

## Gems
The project uses the following gems:
- `rails`, `~> 7.1.3`, `>= 7.1.3.4`
- `pg`, `~> 1.1`
- `administrate`, `~> 0.20.1` for the admin dashboard
- `devise`, `~> 4.9` for user authentication and management

## System Dependencies
This project requires the following system dependencies:
- Ruby 3.2.2 -> https://www.ruby-lang.org/en/downloads/
- Rails 7.1.3.4 -> https://guides.rubyonrails.org/v5.0/getting_started.html
- PostgreSQL 1.1 ->  https://www.postgresql.org/download/

## Configuration
1. Clone the repository.
    ```
    git clone git@github.com:Adel-Saleh96/mini-sales-management.git
    ```

2. Install the required gems by running `bundle install`.
3. Set up the database by running `rails db:create` and `rails db:migrate`.
4. (Optional) Seed the database with sample data by running `rails db:seed`.
5. Start the server by running `rails server`.

## Features
The Mini Sales Management System includes the following features:

1. **Manage Daily Sales**: Users can add, edit, and view daily sales records.
2. **Create Invoices**: Users can create invoices with items, and view and edit existing invoices.
3. **Manage Products**: Users can add, edit, and view products with prices.
4. **Manage Suppliers**: Users can add, edit, and view suppliers.
5. **Manage Users**: Users can be assigned roles (admin or not) and their access can be managed accordingly.
6. **Admin Dashboard**: The admin dashboard, powered by the `administrate` gem, provides a centralized interface for managing all aspects of the system.
7. **User Authentication**: The `devise` gem is used for user authentication and management.
