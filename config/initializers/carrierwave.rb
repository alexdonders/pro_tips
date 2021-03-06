require 'carrierwave/orm/activerecord'

# CarrierWave.configure do |config|
#   config.fog_provider = 'fog/aws'
#   config.fog_credentials = {
#     provider: 'AWS',
#     aws_access_key_id: ENV['AWS_ACCESS_KEY'],
#     aws_secret_access_key: ENV['AWS_SECRET_KEY']
#   }
#   config.fog_directory = ENV['AWS_BUCKET']
# end

CarrierWave.configure do |config|
  config.storage = :aws
  config.aws_bucket = ENV['AWS_BUCKET']
  config.aws_acl = :public_read

  config.aws_credentials = {
    access_key_id: ENV['AWS_ACCESS_KEY'],
    secret_access_key: ENV['AWS_SECRET_KEY'],
    region: ENV['AWS_REGION']
  }
end
