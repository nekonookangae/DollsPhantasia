class Post < ApplicationRecord
  # carrierwave
  mount_uploader :image, ImageUploader
  belongs_to :category

  # monthly archive
  def self.divide_monthly
    self.pluck(:created_at)
        .group_by { |timezone| timezone.strftime('%Y%m') }
        .map { |k, v| [k, v.size] }.sort.reverse
  end
end
