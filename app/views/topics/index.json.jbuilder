json.array!(@topics) do |topic|
  json.extract! topic, :id, :name, :post_count, :post
  json.url topic_url(topic, format: :json)
end
