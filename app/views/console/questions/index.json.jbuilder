json.array!(@questions) do |question|
  json.extract! question, :id, :order, :detail, :alert_type_id
  json.url question_url(question, format: :json)
end
