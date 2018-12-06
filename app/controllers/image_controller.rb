class ImageController < ApplicationController
  before_action :set_s3_direct_post

  def presigned_post
    render json: {
      data: {
        code: 'ok',
        url: @s3_direct_post.url,
        host: URI.parse(@s3_direct_post.url).host,
        fields: @s3_direct_post.fields,
      }
    }
  end

  private

  def set_s3_direct_post
    @s3_direct_post = S3_BUCKET.presigned_post(
      key: "uploads/#{SecureRandom.uuid}",
      content_length_range: 0..10240,
      acl: 'public-read',
      metadata: {
        'original-filename' => '${filename}'
      })
  end
end
