CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => ENV['KEY_ID'],
      :aws_secret_access_key  => ENV['SEC_ACCESS_KEY'],
      :region                 => 'us-west-1' # Change this for different AWS region. Default is 'us-east-1'
  }
  config.fog_directory  = "photography-website"
end