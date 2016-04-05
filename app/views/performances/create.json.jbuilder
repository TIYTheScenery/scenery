json.success @success
if @success
  json.performance do
    json.owner_id @performance.owner_id
    json.company_id @performance.company_id
    json.name @performance.name
    json.description @performance.description
    json.trailer_link @performance.trailer_link
    json.ticket_link @performance.ticket_link
  end
else
  json.errors @performance.errors.full_messages
end
