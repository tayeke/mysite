# Just set these in heroku configs :)
# if defined?(AssetSync)
#   AssetSync.configure do |config|
#     config.fog_provider = 'AWS'
#     config.aws_access_key_id = ENV['AWS_ACCESS_KEY_ID']
#     config.aws_secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
#     config.fog_directory = 'tayloreke'
#     config.fog_region = 'us-west-2' #OREGON
    
#     # Don't delete files from the store
#     # config.existing_remote_files = "keep"
#     #
#     # Automatically replace files with their equivalent gzip compressed version
#     # config.gzip_compression = true
#     #
#     # Use the Rails generated 'manifest.yml' file to produce the list of files to 
#     # upload instead of searching the assets directory.
#     # config.manifest = true
#     #
#     # Fail silently.  Useful for environments such as Heroku
#     config.fail_silently = true
#   end
# end

Paperclip::Attachment.default_options.merge!(
  :storage => :s3,
  :bucket => 'tayloreke',
  :path => "/:class/:attachment/:id/:style/:filename",
  :url => ":s3_domain_url",
  :s3_credentials => {
    :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
    :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
  },
  :s3_permissions => :public_read
)

require 'dragonfly'

app = Dragonfly[:images]
app.configure_with(:imagemagick)
app.configure_with(:rails)
app.datastore = Dragonfly::DataStorage::S3DataStore.new
app.datastore.configure do |c|
  c.bucket_name = 'tayloreke'
  c.access_key_id = ENV['AWS_ACCESS_KEY_ID']
  c.secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
  c.region = 'us-west-2'                      
  c.storage_headers = {'x-amz-acl' => 'public-read'}
end

app.define_macro(ActiveRecord::Base, :image_accessor)


# CarrierWave.configure do |config|
#   config.fog_credentials = {
#     :provider               => 'AWS',                      
#     :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],                    
#     :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'],                      
#     :region                 => 'us-west-2' #OREGON
#   }
#   config.fog_directory  = 'tayloreke'                   
#   config.fog_public     = true                             
#   # config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
# end