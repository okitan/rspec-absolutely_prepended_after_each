# Rspec::AbsolutelyPrependedAfterEach [![Build Status](https://travis-ci.org/okitan/rspec-absolutely_prepended_after_each.png)](https://travis-ci.org/okitan/rspec-absolutely_prepended_after_each) [![Dependency Status](https://gemnasium.com/okitan/rspec-absolutely_prepended_after_each.png)](https://gemnasium.com/okitan/rspec-absolutely_prepended_after_each)

forcelly prepend at the top of the after:each


It suits for example:
 * take screen shot of selenium test BEFORE the teardown of after hooks

## Installation

Add this line to your application's Gemfile:

    gem 'rspec-absolutely_prepended_after_each'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rspec-absolutely_prepended_after_each

## Usage

```ruby
require "rspec/absolutely_prepended_after_each"

RSpec.configure do |config|
  config.absolutely_prepend_after_each do
    # codes you'd like to execute before every after(:each) blocks
  end
end
```

```ruby
require "rspec/absolutely_prepended_after_each"

describe "some description" do
  absoutely_prepend_after_each do
    # codes you'd like to execute before every after(:each) blocks below
  end

  context "some context" do
    after(:each) { "some teardown" }
  end
end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
