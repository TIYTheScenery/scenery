json.success @success
if @success
  json.opportunity do
    json.id @opportunity.id
    json.company_id @opportunity.company_id
    json.venue_id @opportunity.venue_id
    json.name @opportunity.name
    json.description @opportunity.description
    json.contact_info @opportunity.contact_info
  end
else
  json.errors @opportunity.errors.full_messages
end
