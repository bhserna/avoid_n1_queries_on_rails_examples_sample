# Answers

## Answer 1

```ruby
Post.includes(:comments).to_a
```

* When calling `to_a`

## Answer 2

```ruby
Post.includes(:comments).order(:id).to_a
```

* When calling `to_a`

## Answer 3

```ruby
Post.all.each do |post|
  post.comments
  post.sorted_comments.to_a
end
```

* When calling `each` on `Post.all.each`
* When calling `to_a` on `post.sorted_comments`

## Answer 4

```ruby
Post.includes(:comments).each do |post|
  post.comments.to_a
end
```

* When calling `each` on `Post.includes(:comments).each`

<div style="page-break-after: always; break-after: page;"></div>

## Answer 5

```ruby
Post.includes(:comments).each do |post|
  post.comments.order(:id)
  post.comments.order(:id).to_a
end
```

* When calling `each` on `Post.includes(:comments).each`
* When calling `to_a` on `post.comments.order(:id).to_a`

## Answer 6

```ruby
Post.includes(:sorted_comments).each do |post|
  post.sorted_comments.to_a
  post.comments.to_a
end
```

* When calling `each` on `Post.includes(:sorted_comments).each`
* When calling `to_a` on `post.comments.to_a`

## Answer 7

```ruby
Post.includes(:sorted_comments).each do |post|
  post.sorted_comments.first
  post.comments.first
end
```

* When calling `each` on `Post.includes(:sorted_comments).each`
* When calling `first` on `post.comments.first`

## Answer 8

```ruby
Post.includes(:sorted_comments).map do |post|
  post.sorted_comments.last
  post.comments.last
end
```

* When calling `map` on `Post.includes(:sorted_comments).map`
* When calling `last` on `post.comments.last`

## Answer 9

```ruby
Post.includes(:sorted_comments).sort_by(&:id).each do |post|
  post.sorted_comments.limit(1).first
  post.comments.to_a.limit(1).first
end
```

* When calling `sort_by` on `Post.includes(:sorted_comments).sort_by(&:id).each`
* When calling `first` on `post.sorted_comments.limit(1).first`
* When calling `first` on `post.comments.to_a.limit(1)`

## Answer 10

```ruby
Post.includes(:comments).where("comments.points > 5").references(:comments).each do |post|
  post.comments.to_a
  post.comments.order(:id).to_a
  post.comments.sort_by(&:id).to_a
end
```

* When calling `each` on `Post.includes(:comments).where("comments.points > 5").references(:comments).each`
* When calling `to_a` on `post.comments.order(:id).to_a`
