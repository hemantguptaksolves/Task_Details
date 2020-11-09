# frozen_string_literal: true

class Post < ApplicationRecord
  has_many :comments
  has_attached_file :image, styles: { medium: '300x400#', thumb: '100x100>' }
  validates_attachment_content_type :image, content_type: %r{\Aimage/.*\z}
end
