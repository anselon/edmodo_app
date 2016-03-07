json.array!(@flags) do |owner|
  json.extract! flag, :reason
  json.url flag_url(flag, format: :json)
end
