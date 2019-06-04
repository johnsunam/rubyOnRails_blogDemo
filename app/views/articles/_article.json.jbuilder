json.extract! article, :id, :title, :text, :description, :created_at, :updated_at
json.url article_url(article, format: :json)
