json.array!(@videos) do |video|
  json.extract! video, :id, :name, :lastname, :email, :message, :converted, :contest_id, :video
  json.url video_url(video, format: :json)
end
