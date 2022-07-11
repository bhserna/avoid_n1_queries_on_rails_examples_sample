# 01 What is an n+1 queries problem

Explore, read, run and try to understand why, when and how the n+1 queries are happening on each example.

1. [Fetching the comments for each post](examples/00_post_comments.rb)
2. [Fetching the post for each comment](examples/01_comment_post.rb)
3. [Counting the comments for each post](examples/02_count_post_comments.rb)
4. [Counting the comments for each post with size](examples/03_size_post_comments.rb)
4. [Counting the comments for each post with length](examples/04_length_post_comments.rb)
5. [Fetching the post for each comment without using the association](examples/05_not_by_association.rb)
6. [Fetching the latest comment for each post](examples/06_latest_post_comment.rb)
7. [Fetching the first comment for each post](examples/07_first_post_comment.rb)
8. [Fetching the comment ids for each post](examples/08_post_comment_ids.rb)

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
