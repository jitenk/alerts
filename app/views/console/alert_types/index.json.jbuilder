json.array!(@alert_types) do |alert_type|
  json.extract! alert_type, :id, :name
  json.url alert_type_url(alert_type, format: :json)
end
