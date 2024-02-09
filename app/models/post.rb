class Post < ApplicationRecord
  belongs_to :user
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  has_many :comments, dependent: :destroy

  mount_uploader :post_image, AvatarUploader

  validates :post_type, presence: true
  validates :body, length: { maximum: 65_535 }, presence: true
  
  enum post_type: { question: 0, tweet: 1 }

  def self.ransackable_attributes(auth_object = nil)
    %w[body post_type tag_name]
  end

  ransacker :tag_name, formatter: proc { |v|
  tags = Tag.where(name: v).pluck(:id)
  posts = Post.joins(:tags).where(tags: { id: tags }).pluck(:id)
  posts.present? ? posts : nil
  } do |parent|
    parent.table[:id]
  end

 # def self.ransackable_associations(auth_object = nil)
 #   ["tag"]
 # end


  def save_tag(sent_tags)
    current_tags = tags.pluck(:name) unless tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      tags.delete Tag.find_by(name: old)
    end

    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(name: new)
      tags << new_post_tag
    end
  end
end
