# Lattice

Lattice is a framework inspired by Rails that focuses on GraphQL. By
leveraging Ruby's dynamic (and evil) metaprogramming features, Lattice
takes the Rails philosophy of Convention Over Configuration and
developer happiness and applies that to GraphQL. But enough buzzwords;
what does that mean?

Lattice lets you write terse, coherent code that creates GraphQL
queries that follow a strict convention. For instance, instead of
manually defining a bunch of different queries for querying a model by
a certain field, Lattice allows you to simply write:

```
class Post < Sequel::Model
  queryable_on :id, ID
  queryable_on :title, String
end
```

Which will generate the following queries: 
```
post(id: Int!)
postByTitle(title: String!)
```


Lattice is currently still in progress, but `queryable_on` works. Feel
free to clone and check it out!


## FAQ

I haven't actually been asked these questions yet (unless you count
asking myself), but I figure they'll be useful discussion points.

- Q: Why not ActiveRecord?
- A: ActiveRecord, while an amazing piece of software, is essentially
  an internal library in Rails. And while the Rails dev team is pretty
  good about backwards compatibility, there's no guarantee they'll
  keep *internal* backwards compatibility. Sequel, on the other hand,
  is an external library like any other. If Sequel were to break
  backwards compatibility, there would at the very least be a lot of
  complaining. Don't get me wrong, I'd love to use ActiveRecord. I
  like ActiveRecord a lot. But it seemed wrong to build Lattice off an
  internal dependency just for Rails.
  
- Q: Why did you build this? Rails + GraphQL Ruby works fine.
- A: Very good question, imaginary person. I've used GraphQL Ruby and
  Rails together in a few different places, such as
  (StuySpec)[https://github.com/stuyspec] and some other hackathon
  projects. It's an excellent combo, in my opinion the most ergonomic
  stack for GraphQL. You don't have to do any complicated library
  connecting (connect the query builder to the GraphQL library to the
  server to the ...) and it meshes quite nicely into the GraphQL
  paradigm. However, there's a few issues. First,
  inconsistency. GraphQL query names are kind of in a wild west sort
  of state. People may name them `getArticleById`, `articleById` or
  just `article`. Second, by using GraphQL Ruby with Rails, you kinda
  get rid of a lot of the Rails part. I stopped using Rails views,
  then Rails controllers, then pretty much everything except the ORM
  and GraphQL Ruby. Finally, there wasn't a very good separation of
  concerns. All my code seemed to exist in this continuum between the
  model, the QueryType and maybe some resolvers I wrote. Not exactly
  comparable to the neat divisions of MVC! Finally, there's still some
  issues with GraphQL Ruby. Authentication is kind of jenky and the
  code generation isn't fantastic. I started Lattice to fix all of
  these problems and maybe more. I could go on and on about this, so
  maybe I'll just write an article. Someday.
  
  
  
  
