require_relative "config"
require_relative "../lib/models"

# Change the variable n and see in the console how
# it makes n queries to fetch the post of each comment.

n = 5

# 1 query to fetch the comments
Comment.all.limit(n).each do |comment|
  # n more queries to fetch the post of each comment
  comment.post.title
end

# Comment Load (0.4ms)  SELECT "comments".* FROM "comments" LIMIT $1  [["LIMIT", 5]]
# Post Load (0.3ms)  SELECT "posts".* FROM "posts" WHERE "posts"."id" = $1 LIMIT $2  [["id", 1], ["LIMIT", 1]]
# Post Load (0.3ms)  SELECT "posts".* FROM "posts" WHERE "posts"."id" = $1 LIMIT $2  [["id", 1], ["LIMIT", 1]]
# Post Load (0.3ms)  SELECT "posts".* FROM "posts" WHERE "posts"."id" = $1 LIMIT $2  [["id", 1], ["LIMIT", 1]]
# Post Load (0.2ms)  SELECT "posts".* FROM "posts" WHERE "posts"."id" = $1 LIMIT $2  [["id", 1], ["LIMIT", 1]]
# Post Load (0.3ms)  SELECT "posts".* FROM "posts" WHERE "posts"."id" = $1 LIMIT $2  [["id", 1], ["LIMIT", 1]]