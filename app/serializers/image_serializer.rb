class ImageSerializer
include JSONAPI::Serializer
  attributes :raw_image
end