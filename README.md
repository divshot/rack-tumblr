# Rack::Tumblr

A Rack middleware that uses `Rack::ReverseProxy` to mount a Tumblr
blog into your Ruby application.

## Installation

Add this line to your application's Gemfile:

    gem 'rack-tumblr'

And then execute:

    $ bundle

## Usage

```ruby
use Rack::Tumblr, prefix: "/blog", name: "mytumblrname"
```

### Available Options

* **prefix:** The prefix to detect on your app. Defaults to `/blog`
* **name:** The name of your Tumblr blog (i.e. `puppies` from `puppies.tumblr.com`)
* **domain:** The domain of your Tumblr blog (use instead of name if you have a custom DNS record Tumblr)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

Copyright (c) 2012 Divshot, Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.