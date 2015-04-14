# Driver

Simple Framework for API Client.

Client, Model, APIを分離するアイデアです.

## Client層
 - ユーザとのやり取りはすべてこのClient経由で行う。
 - 基本的にはモデルインスタンスを返却する。
 - APIを直接呼び出すことも可能。
 
## Model層
 - APIからデータを取得し、自インスタンスをClientへ返却する。

## API層
 - 実際にWebServerのAPIを叩く部分。

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'driver'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install driver

## Usage

```ruby
require 'driver'
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/driver/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
