json.genres @genres.each do |g|
  json.id g.id
  json.category g.category
end
