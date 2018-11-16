# Action Pager

コレクション(Array, ActiveRecord::Relationなど)で使用できるシンプルで軽量なページネーターです。

## 特徴

- シンプルな`pager`オブジェクトがページネーションで使用されます。
  - 元のコレクションを汚染しません。
- 他のGem (Kaminari, Will Paginateなど)に比べるとメモリ消費が非常に少ないです。
- カスタマイズが簡単です。
  - ページネーターのビューとヘルパのファイルがアプリ内に生成されます。
  - 用途に応じてカスタマイズできます。

## インストール

アプリケーションのGemfile以下の行を追加します。

```ruby
gem "actionpager"
```

以下を実行します。

    $ bundle

または、以下のようにインストールします。

    $ gem install actionpager

Railsで使用するには以下のコマンドを実行します

    $ rails g action_pager:install

2つのファイルが生成され、カスタマイズすることができます。

- `app/helpers/action_pager/pagination_helper.rb`
- `app/views/action_pager/_pager.html.erb`

## 使い方

シンプルな配列で使う場合

```ruby
collection = (1..128).to_a
pager = ActionPager::Pager.new(collection, page: 3, per: 10)

pager.current_collection # => [21, ..., 30]
```

ActiveRecordのコレクションで使う場合

```ruby
resources = Book.recent_published
@pager = ActionPager::Pager.new(resources, page: 2, per: 25)
@books = pager.current_collection
```

Railsのビューでページャーを表示するには、以下のようにコードを記述します。

```erb
<%= render_pager @pager %>
```



## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Actionpager project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/actionpager/blob/master/CODE_OF_CONDUCT.md).
