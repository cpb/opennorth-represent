# Opennorth::Represent

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'opennorth-represent'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install opennorth-represent

## Usage

```ruby
require 'opennorth/represent'

service = Opennorth::Represent.new

postal_code = service.postal_codes.get("V6H2V4") # or your own postal code

member_of_parliament = postal_code.representatives.where(elected_office: "MP").first
hill_office = member_of_parliament.offices.where(type: "legislature").first

puts "To: #{member_of_parliament.honorific_prefix} #{member_of_parliament.name}"
puts "#{hill_office.postal}"
puts
puts "Dear, #{member_of_parliament.name}"
puts
puts "My message goes here"
puts
puts "Yours truly,"
puts "A constituent"
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
