json.favorite_photos @favorite_photos do |favorite_photo|
  json.id favorite_photo.id
  json.id favorite_photo.user_id
  json.id favorite_photo.photo_id
end
