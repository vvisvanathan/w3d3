class Tagging < ActiveRecord::Base
  belongs_to(
    :topic,
    class_name: 'TagTopic',
    primary_key: :id,
    foreign_key: :tag_id
  )

  belongs_to(
    :tagger,
    class_name: 'User',
    primary_key: :id,
    foreign_key: :tagger_id
  )

  belongs_to(
    :url,
    class_name: 'ShortenedUrl',
    primary_key: :id,
    foreign_key: :url_id
  )

  def self.tag!(usr, url, topic)
    Tagging.create!(
      tagger_id: usr.id,
      url_id: url.id,
      tag_id: topic.id
    )
  end
end
