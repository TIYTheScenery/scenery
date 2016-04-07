json.array!(@performances) do |performance|
  json.extract! performance, :id, :owner_id, :company_id, :name, :description, :trailer_link, :ticket_link
  json.url performance_url(performance, format: :json)
end
