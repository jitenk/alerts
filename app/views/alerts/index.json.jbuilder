json.array!(@alerts) do |alert|
  json.extract! alert, :id, :name
  json.url alert_url(alert, format: :json)
end
