require_relative "config"
require_relative "../lib/models"

# Change the variable n and see in the console how
# it makes n queries to fetch the latest comment of each post.

n = 5

# 1 query to fetch the posts
Post.all.limit(n).each do |post|
  # n more queries to fetch the latest comment of each post
  post.comments.last.body
end

# Post Load (0.3ms)  SELECT "posts".* FROM "posts" LIMIT $1  [["LIMIT", 5]]
# Comment Load (12.9ms)  SELECT "comments".* FROM "comments" WHERE "comments"."post_id" = $1 ORDER BY "comments"."id" DESC LIMIT $2  [["post_id", 1], ["LIMIT", 1]]
# Comment Load (2.5ms)  SELECT "comments".* FROM "comments" WHERE "comments"."post_id" = $1 ORDER BY "comments"."id" DESC LIMIT $2  [["post_id", 2], ["LIMIT", 1]]
# Comment Load (2.4ms)  SELECT "comments".* FROM "comments" WHERE "comments"."post_id" = $1 ORDER BY "comments"."id" DESC LIMIT $2  [["post_id", 3], ["LIMIT", 1]]
# Comment Load (1.9ms)  SELECT "comments".* FROM "comments" WHERE "comments"."post_id" = $1 ORDER BY "comments"."id" DESC LIMIT $2  [["post_id", 4], ["LIMIT", 1]]
# Comment Load (2.1ms)  SELECT "comments".* FROM "comments" WHERE "comments"."post_id" = $1 ORDER BY "comments"."id" DESC LIMIT $2  [["post_id", 5], ["LIMIT", 1]]