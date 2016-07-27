json.array!(@motels) do |motel|
  json.extract! motel, :id
  json.url motel_url(motel, format: :json)
end
