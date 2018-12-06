class ImageController < ApplicationController
  before_action :set_s3_direct_post

  def presigned_post
    render json: {
      data: {
        code: 'ok',
        url: @s3_direct_post.url,
        fields: @s3_direct_post.fields,
      }
    }
  end

  private

  def set_s3_direct_post
    @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
  end
end