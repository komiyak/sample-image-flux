# Preparing a s3 object for uploading image files directly.
# https://devcenter.heroku.com/articles/direct-to-s3-image-uploads-in-rails
Aws.config.update(
  {
    region: 'ap-northeast-1',
    credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY']),
  })

S3_BUCKET = Aws::S3::Resource.new.bucket(ENV['S3_BUCKET'])
