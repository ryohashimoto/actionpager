# Action Pager

Simple, lightweight and easy to customize paginator for collections (Array, ActiveRecord::Relation etc.)

# Features

- A simple `pager` object is used for pagination.
  - It does not pollute the original collection.
- Consumes less memory than other gems (i.e. Kaminari, Will Paginate etc.).
- Easy to customize.
  - Paginator view and helper files are generated in your app.
  - You can customize for your own purpose.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "actionpager"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install actionpager

Use with Rails

    $ rails g action_pager:install

It generates two files and you can customize.

- `app/helpers/action_pager/pagination_helper.rb`
- `app/views/action_pager/_pager.html.erb`

## Usage

Use with a simple array:

```ruby
collection = (1..128).to_a
pager = ActionPager::Pager.new(collection, page: 3, per: 10)

pager.current_collection # => [21, ..., 30]
```

Use with an ActiveRecord collection

```ruby
resources = Book.recent_published
@pager = ActionPager::Pager.new(resources, page: 2, per: 25)
@books = pager.current_collection
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Actionpager project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/actionpager/blob/master/CODE_OF_CONDUCT.md).
