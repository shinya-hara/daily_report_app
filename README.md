# Daily Report App

Ruby on Railsで開発中の「日報アプリ」


## 主要なGem

- devise
- cancancan
- rails_admin
- kaminari
- slim-rails

### devise
ログイン認証機能を提供する

*deviseのインストール*
~~~
rails g devise:install
~~~

*ログイン認証用のファイル生成*
~~~
rails g devise User
~~~


### cancancan
権限管理

### rails_admin
管理者画面を作成  
deviseを利用しているため、deviseは必須

*rails_adminのインストール*
~~~
rails g rails_admin:install
rails db:migrate
~~~

### kaminari
ページネーション機能を提供  

*reports_controller.rb を編集*
~~~rb
class ReportsController < ApplicationController
  def index
    @reports = Report.page(params[:page]).per(10).order(date: :desc)
    respond_to do |format|
      format.html
      format.js
    end
    @user = current_user || User.new
  end
end
~~~
~~~rb
@reports = Report.page(params[:page])
~~~
基本はこれでOK  
`.per(10)`で1ページ10件表示  
順番は`.order(date: :desc)`などで指定

*index.html.slim を編集*
~~~rb
= paginate @reports
~~~

Viewを変更する際は `rails g kaminari:views default` を実行  
`app/views/kaminari/`以下にviewが生成される  
`default`はテーマを指していて、`bootstrap4`や`google`などが指定可能（らしいが`bootstrap4`は失敗した）

### slim-rails
slimとは、可読性を保ちつつ、コード量を減らせるテンプレートエンジン  
Railsのデフォルトはerb  
パフォーマンスは、erb/hamlより優秀

*application.html.erb*
~~~html
<!DOCTYPE html>
<html>
<head>
  <title>SlimTest</title>
  <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track' => true %>
  <%= javascript_include_tag 'application', 'data-turbolinks-track' => true %>
  <%= csrf_meta_tags %>
</head>
<body>

<header id="header">
  <h1 class="title logo">Slim Test</h1>
</header>

<%= yield %>

</body>
</html>
~~~
slimで書き直すと
~~~rb
DOCTYPE
html
  head
    title SlimTest
    = stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track' => true
    = javascript_include_tag 'application', 'data-turbolinks-track' => true
    = csrf_meta_tags

  body

    header#header
      h1.title.logo Slim Test

    == yield
~~~
スッキリ
