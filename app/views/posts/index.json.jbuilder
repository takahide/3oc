json.array!(@posts) do |post|
  json.extract! post, :id, :title, :contributer, :body
  json.url post_url(post, format: :json)
end
