class RenameVersionUrlUriHashLengthHeaders < ActiveRecord::Migration[6.1]
  def change
    change_table :versions do |t|
      t.rename :capture_url, :url
      t.rename :uri, :body_url
      t.rename :version_hash, :body_hash
      # XXX: decide whether to do this one
      # t.rename :content_length, :body_length

      # This will need a corresponding data migration to backfill
      # from source_metadata.headers when present.
      t.jsonb :headers
    end
  end
end
