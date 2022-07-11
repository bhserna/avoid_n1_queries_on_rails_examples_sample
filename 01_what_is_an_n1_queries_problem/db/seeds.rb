require_relative "config"
require_relative "../lib/models"
require "ffaker"

def create_many(klass, count, &block)
  records_data = count.times.map(&block)
  ids = klass.insert_all(records_data, unique_by: :id, record_timestamps: true).map { |data| data["id"] }
  klass.where(id: ids)
end

def create_many_for(klass, parent_records, count, &block)
  records_data = parent_records.flat_map { |parent_record| count.times.map { block.(parent_record) } }
  ids = klass.insert_all(records_data, record_timestamps: true)
  klass.where(id: ids)
end

def create_posts(count, &block)
  create_many Post, count, &block
end

def create_comments(posts, count, &block)
  create_many_for Comment, posts, count, &block
end

posts = create_posts(100) do
  { title: FFaker::Name.name }
end

create_comments(posts, 100) do |post|
  { post_id: post.id, body: FFaker::CheesyLingo.paragraph }
end