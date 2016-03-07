json.array!(@products) do |product|
  json.extract! product, :id, :title, :img_path, :seller_thumb_url, :edmodo_url, :price, :currency, :avg_rating, :num_raters, :long_desc_html, :owner_id
  json.url product_url(product, format: :json)
end
