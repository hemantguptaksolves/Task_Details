class User < ApplicationRecord
 # validate :headerImage
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        # mount_uploader :attachment, AttachmentUploader

         has_one_attached :header_image
        #  has_many_attached :uploads
        # def headerImage
        #   return unless header_image.attached?
        #   unless header_image.byte_size <= 1.meghabyte
        #     errors.add(:header_image,"Please compress")
        #   end

        #   acceptable_types = ["image/jpeg", "image/png"]
        #   unless acceptable_types.include?(header_image.content_type)
        #     errors.add(:header_image,"please insert jpeg or png file")
        #   end

        # end
end
