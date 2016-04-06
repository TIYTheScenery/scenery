json.success true
json.performances @performances.each do |per|
  json.id per.id
  json.owner_id per.owner_id
  json.company_id per.company_id
  json.name per.name
  json.description per.description
  json.trailer_link per.trailer_link
  json.ticket_link per.ticket_link
end
