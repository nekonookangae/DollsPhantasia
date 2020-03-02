# DollsPhantasia


<img src="mainpage.png" width=600>


このリポジトリは、私がRuby on Railsで開発したポートフォリオ用のブログです。<br>
Heroku上の https://dolls-phantasia.herokuapp.com/ で実際に動いています。<br>
なお、背景画像はフリーサイトのものを、LogoとProfileの東方キャラクターの画像については[幻想幽玄庵](http://gensoukyou.1000.tv/index.html)さんから素材をお借りしています。<br>
**なお、これらの素材をリポジトリに含める行為は再配布にあたると判断したため、元画像のDL先のリンクを以下に記します。**
- alice.png, udonge.png
  - http://gensoukyou.1000.tv/dl.html (妖々夢, 永夜抄)
- brawn-wood.jpg
  - https://www.pexels.com/photo/brown-wooden-floor-172292/
- woodhouse.jpg
  - https://pixabay.com/photos/log-cabin-cottage-house-home-1886620/
- wood-side.jpg
  - https://pxhere.com/en/photo/1030950
- wood.jpg
  - 不明

## バージョン
  | Gem               | version          |
  |:------------------|:-----------------|
  | Ruby              | == 2.7.0         |
  | Rails             | 5.2.4 ~ 5.2.4.1  |
  | Bootstrap         | ~> 4.4.1         |
  | Font-awesome-sass | ~> 5.12.0        |
  | Summernote-rails  | ~> 0.8.12.0      |

## インストール & 実行
```
 git https://github.com/hk-nyao/DollsPhantasia.git
 cd DollsPhantasia
```
ローカル環境のGemのみインストール & Active adminのインストール
```
 bundle install --without production
 rails g devise:install
 rails g active_admin:install
 ```
active_admin.js および active_admin.scssの上書きをしていいか聞かれるので、"n"を入力

Active adminとテーブルの関連付け
```
 rails db:migrate
 rails g active_admin:resource Category
 rails g active_admin:resource Post
```

Active adminでテーブルの操作を可能にするため、
app/admin/categories.rbの以下の行のコメントアウトを外す
```
 ...
 # permit_params :name  # この行
 ...
```

同様に、app/admin/posts.rbの以下の行のコメントアウトを外す
```
 ...
 # permit_params :title, :category_id, :image, :content
 ...
```

Active adminの管理者を生成
```
 rails c
 irb(main):001:0> AdminUser.create(email: 'メールアドレスをここに入力', password: 'パスワードをここに入力')
 irb(main):002:0> exit
```


実行！
```
 rails s
```

最後に、/adminでログイン後、管理者画面でCategoryを
  1. Drawing
  2. Technology
  3. Baseball
  4. Others

のID順で作成すれば完成！<br>
* 注意点：<br>
 Postの新規作成、編集、削除はログイン状態でのみ可能。<br>
 新規作成のリンクはposts#indexに、編集・削除のリンクはposts#showページに貼ってある

## 工夫点
  * Summernoteを使って記事を作成
   - 新規作成ページでレイアウトを確認しながら作業可能
  * レスポンシブ対応

## 改善点
  * 詳細画面において、"Next"と"Prev"の記事を表示させる
  * コメント機能(ユーザー登録不要、サニタイズ処理)の実装
  * いいね機能(ユーザー登録不要)の実装
  * HTMLタグ・構成の見直し
