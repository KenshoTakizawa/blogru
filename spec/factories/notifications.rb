FactoryBot.define do
  factory :notification do
    visiter_id {}
    visited_id {}
    article_id {}
    comment_id {2}
    action {"comment"}
    checked {"false"}

  end
end
