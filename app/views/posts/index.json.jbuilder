json.array!(@posts) do |post|
  json.extract! post, :id, :title, :content, :reply_count, :view_count, :topic_id, :user_id, :replies
  json.url post_url(post, format: :json)
end
