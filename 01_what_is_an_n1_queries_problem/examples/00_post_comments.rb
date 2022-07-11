require_relative "config"
require_relative "../lib/models"

# Change the variable n and see in the console how
# it makes n queries to fetch the comments of each post.

n = 5

# 1 query to fetch the posts
Post.all.limit(n).each do |post|
  # n more queries to fetch the comments of each post
  post.comments.each do |comment|
    comment.body
  end
end

# Post Load (0.3ms)  SELECT "posts".* FROM "posts" LIMIT $1  [["LIMIT", 5]]
# Comment Load (0.8ms)  SELECT "comments".* FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]
# Comment Load (0.4ms)  SELECT "comments".* FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 2]]
# Comment Load (0.3ms)  SELECT "comments".* FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 3]]
# Comment Load (0.4ms)  SELECT "comments".* FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 4]]
# Comment Load (0.4ms)  SELECT "comments".* FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 5]]