require_relative "config"
require_relative "../lib/models"

# Change the variable n and see in the console how
# it makes n queries to fetch the comments count of each post.

n = 5

# 1 query to fetch the posts
Post.all.limit(n).each do |post|
  # n more queries to count (with size) the comments of each post
  post.comments.size
end

# Post Load (0.4ms)  SELECT "posts".* FROM "posts" LIMIT $1  [["LIMIT", 5]]
# Comment Count (5.8ms)  SELECT COUNT(*) FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]
# Comment Count (0.3ms)  SELECT COUNT(*) FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 2]]
# Comment Count (0.3ms)  SELECT COUNT(*) FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 3]]
# Comment Count (0.4ms)  SELECT COUNT(*) FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 4]]
# Comment Count (0.3ms)  SELECT COUNT(*) FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 5]]