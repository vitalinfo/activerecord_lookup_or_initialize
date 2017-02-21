# activerecord_lookup_or_initialize

Extension for ActiveRecord::Relation.
Search object inside association. 


Method `find_or_initialize_by` return object outside collection, to get back inside use `lookup_or_initialize_by` instead.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'activerecord_lookup_or_initialize'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activerecord_lookup_or_initialize

## Usage
```ruby
class User < ActiveRecord::Base
  has_many :comments, dependent: :destroy, inverse_of: :user
end

class Comment < ActiveRecord::Base
  belongs_to :user, inverse_of: :comments
end

user = User.first
comment = user.comments.lookup_or_initialize_by(message: 'first user message')
```

## Contributing
1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request