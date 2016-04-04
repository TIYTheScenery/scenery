json.success @performance.success
  json.results do
    json.performance do
      json.owner_id @performance.owner_id
      json.company_id @performance.company_id
      json.name @performance.performance.name
      json.description @performance.description
      json.trailer_link @performance.trailer_link
      json.ticket_link @performance.ticket_link
    end
  end
end
