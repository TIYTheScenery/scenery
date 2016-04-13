json.success @success
if @success
else
  json.errors @opportunity.errors.full_messages
end
