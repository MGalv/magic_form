# magic_form

The laziest way to implement a *Form*. This gem extends Rails 3 ActionView::Helpers.

## Installation

### Rails 3

Include it on your Gemfile:

    gem 'magic_form'

And install it

    bundle install

## Usage

You have to call in your view to the helper *magic_form*. Example:

= raw magic_form(@user)

Also, you can define your own attribute layer message. Example:

= raw magic_form(@user, :name => "User name: ", :submit => "Save")

## To Do

* Implement nested resources compatibility.
* Implement a *do* cycle.

## Contributing to magic_form
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2010 Luis Galaviz. See LICENSE.txt for
further details.

