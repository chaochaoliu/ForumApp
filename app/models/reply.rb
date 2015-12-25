class Reply < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  after_create :reply_count_increse
  after_destroy :reply_count_decrese

  protected
  def reply_count_increse
    if post_id.present? 
      post = self.post
      post.increment!(:reply_count)
    end
  end

  def reply_count_decrese
    if post_id.present? 
      post = self.post
      post.decrement!(:reply_count)
    end
  end
end
