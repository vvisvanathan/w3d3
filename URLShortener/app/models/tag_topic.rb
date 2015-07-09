class TagTopic < ActiveRecord::Base
  has_many(
    :tagged_url_ids,
    class_name: "Tagging",
    primary_key: :id,
    foreign_key: :tag_id
  )

  has_many(
    :tagged_urls,
    through: :tagged_url_ids,
    source: :url
  )
end
