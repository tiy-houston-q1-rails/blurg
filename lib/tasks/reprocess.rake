desc "Reprocess all images"
task :reprocess => :environment do

  BlogPost.all.each do |ym|
  begin
    # ym.process_photo_upload = true # only if you use carrierwave_backgrounder
    ym.photo.cache_stored_file!
    ym.photo.retrieve_from_cache!(ym.photo.cache_name)
    ym.photo.recreate_versions!
    ym.save!
  rescue => e
    puts  "ERROR: YourModel: #{ym.id} -> #{e.to_s}"
  end
end

end
