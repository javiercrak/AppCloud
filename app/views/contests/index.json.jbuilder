json.array!(@contests) do |contest|
  json.extract! contest, :id, :name, :url, :startdate, :enddate, :binary_data, :content_type, :description, :user_id
  json.url contest_url(contest, format: :json)
end
