json.extract! review, :id, :star, :comment, :created_at, :updated_at
json.url review_url(review, format: :json)
