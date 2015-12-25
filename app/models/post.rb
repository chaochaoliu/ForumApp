class Post < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  has_many :replies, :dependent => :destroy

  after_create :post_count_increse
  after_destroy :post_count_decrese
  after_update :post_count_change

  protected
  def post_count_increse
    if topic_id.present? 
      topic = self.topic
      topic.increment!(:post_count)
    end
  end

  def post_count_decrese
    if topic_id.present? 
      topic = self.topic
      topic.decrement!(:post_count)
    end
  end

  def post_count_change
    if topic_id_changed?
      
      topic = self.topic
      topic.increment!(:post_count)

      old_id = topic_id_was
      topic = topic.find(old_id)
      topic.decrement!(:post_count)
    end
  end
end
