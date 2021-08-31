class Magazine < ActiveRecord::Base
  has_many :subscriptions
  has_many :readers, through: :subscriptions

  def self.most_popular
    popularity = []
    all.map do |mag|
      count = mag.subscriptions.count
      mag_and_count = [mag, count]
      popularity << mag_and_count
    end
    popularity.sort{|a, b| b[1] <=> a[1]}[0][0]
  end

  def email_list
    emails = []
    readers.map {|reader| emails << reader.email}
    emails.join(";")
  end
end