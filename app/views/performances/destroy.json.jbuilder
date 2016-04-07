json.success @success
if @success
else
  json.errors @performance.errors.full_messages
end
