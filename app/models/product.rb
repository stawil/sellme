class Product < ActiveRecord::Base
  attr_accessible :describtion, :image_url, :title, :price
   
  validates :describtion,  :presence=> true , :length => { :maximum => 60 }
  
  validates :title, :presence=> true , :uniqueness => true
  
  validates :image_url, :presence=> true, :format => { :with => %r{\.(gif|jpg|png)$}i,  :message => "extension %{value} is not included in the list" }
 
  
 
  
  validates_numericality_of :price
  

  validate :price_must_be_at_least_a_cent
protected
def price_must_be_at_least_a_cent
errors.add(:price, 'should be at least 0.01' ) if price.nil? ||
price < 0.01
end
end



