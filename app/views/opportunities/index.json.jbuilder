json.array!(@opportunities) do |opportunity|
  json.extract! opportunity, :id, :company_id, :name, :description, :contact_info
  json.url opportunity_url(opportunity, format: :json)
end
