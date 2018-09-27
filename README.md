# Grate

> It'll be grate

## About

Grate is a GraphQL framework inspired by Rails. Grate aims to make
writing GraphQL APIs as simple and consistent as possible. Therefore,
Grate applies the principles of least surprise and developer happiness.

Grate adapts Rails' MVC architecture to GraphQL, in the form of MTC:
Model Type Controller. On top of this, Grate utilizes Ruby's
metaprogramming features to add a domain specific language that allows
you to automatically make queries on certain types.

But enough buzzwords, what does Grate actually do? Basically, Grate
lets you write: 
```
class PostType < GraphQL::Schema::Object
# Usual GraphQL Ruby stuff...
	queryable_on :title, String
end
```

And Grate will automatically generate a `postByTitle(title: String)`
query! Want more complicated queries? Grate lets you define the
signature in the type file, then write the corresponding code in the
controller and model.

## Installation

You can install grate using the following:

    $ gem install grate
	
To generate a new project, make a directory, then run

    $ grate new NAME
	
All the necessary files will be generated.

## Development

Grate is build using Rack, so all you have to do to run your Grate application is run 

    $ rackup

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/nicholaslyang/grate. This project is intended to
be a safe, welcoming space for collaboration, and contributors are
expected to adhere to the [Contributor
Covenant](http://contributor-covenant.org) code of conduct.

Please add any changes to the
[CHANGELOG](https://github.com/nicholaslyang/grate/blob/master/CHANGELOG.md).

## License

The gem is available as open source under the terms of the [MIT
License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Grate project’s codebases, issue
trackers, chat rooms and mailing lists is expected to follow the [code
of
conduct](https://github.com/nicholaslyang/grate/blob/master/CODE_OF_CONDUCT.md).
