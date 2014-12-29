json.collection @inspection_requests do |json, ir|
  json.id           ir.id
  json.created_at   ir.created_at
  json.full_name    ir.full_name
  json.phone_number ir.phone_number
  json.comment      ir.comment
  json.viewed       ir.viewed
  json.viewed_by    ir.viewed_by.try(:full_name)
end
