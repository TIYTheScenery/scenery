json.array!(@lessons) do |lesson|
  json.extract! lesson, :id, :owner_id, :company_id, :name, :description, :number_of_seats, :ticket_link
  json.url lesson_url(lesson, format: :json)
end
