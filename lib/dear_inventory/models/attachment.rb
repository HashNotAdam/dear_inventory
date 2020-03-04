# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
    class Attachment < DearInventory::Model
      extend T::Sig

      fields({
        ID: {
          name: :id,
          type: :Guid,
        },
        ContentType: {
          name: :content_type,
          type: :String,
        },
        IsDefault: {
          name: :is_default,
          type: :Boolean,
        },
        FileName: {
          name: :file_name,
          type: :String,
        },
        DownloadUrl: {
          name: :download_url,
          type: :String,
        },
      })
    end
  end
end
