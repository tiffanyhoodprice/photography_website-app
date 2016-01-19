json.array! @photos do |photo|
  json.id photo.id
  json.name photo.name
  json.album_id photo.album_id
end