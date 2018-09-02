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
