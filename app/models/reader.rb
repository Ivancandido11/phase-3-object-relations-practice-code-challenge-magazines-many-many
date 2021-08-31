class Reader < ActiveRecord::Base
  has_many :subscriptions
  has_many :magazines, through: :subscriptions

  def subscribe(magazine, price)
    Subscription.create(reader: self, magazine: magazine, price: price)
  end
  
  def total_subscription_price
    subscriptions.sum(:price)
  end

  def cancel_subscription(magazine)
    subscriptions.find_by(magazine_id: magazine.id).destroy
  end
end