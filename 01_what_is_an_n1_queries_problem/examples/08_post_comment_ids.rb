require_relative "config"
require_relative "../lib/models"

# Change the variable n and see in the console how
# it makes n queries to fetch the comments ids of each post.

n = 5

# 1 query to fetch the posts
Post.all.limit(n).each do |post|
  # n more queries to fetch the comments ids of each post
  post.comments.ids
end

# Post Load (0.3ms)  SELECT "posts".* FROM "posts" LIMIT $1  [["LIMIT", 5]]
# Comment Pluck (0.4ms)  SELECT "comments"."id" FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]
# Comment Pluck (0.4ms)  SELECT "comments"."id" FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 2]]
# Comment Pluck (0.3ms)  SELECT "comments"."id" FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 3]]
# Comment Pluck (0.4ms)  SELECT "comments"."id" FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 4]]
# Comment Pluck (0.5ms)  SELECT "comments"."id" FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 5]]