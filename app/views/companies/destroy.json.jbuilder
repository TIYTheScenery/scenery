json.success @success
if @success
else
  json.errors @company.errors.full_messages
end
