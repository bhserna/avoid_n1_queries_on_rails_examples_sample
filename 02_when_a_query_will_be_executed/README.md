# 02 When a query will be executed

Wouldn’t it be nice to just see some piece of code and know when the query will execute?

This exercise will try to help you achieve it. It will help you to identify when a query will execute by just watching the code.

## Instructions

In the `/examples` dir you will find 10 code examples using ActiveRecord’s query interface, like includes, order and where.

For each code example you will:

* Try to identify when ActiveRecord will execute de query
* You can run the example to help you find the place
* Compare your answer with the one I will provide after the example.

You can find the answers on [answers.md](/02_when_a_query_will_be_executed/answers.md)

## How to use it

1. Define a database name on `db/database_name.rb`
2. Define the database schema on `db/schema.rb`
3. Create some seeds if you need them on `db/seed.rb`
4. Add examples on the `examples/` dir, but require first the `examples/config`

## How to run the examples

1. **Install the dependencies** with `bundle install`.

2. **Database setup** - run the command:

```
ruby db/setup.rb
```

3. **Run the examples** with `ruby examples/<file name>`. For example:

```
ruby example/00_example.rb
```

4. **Change the seeds**  on `db/seeds.rb` and re-run `ruby db/setup.rb` to test different scenarios.
