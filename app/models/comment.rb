class Comment < ApplicationRecord
  belongs_to :post
  after_create_commit { RenderCommentJob.perform_later self }
end
