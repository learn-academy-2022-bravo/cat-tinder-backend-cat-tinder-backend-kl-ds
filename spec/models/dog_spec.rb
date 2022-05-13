require 'rails_helper'

RSpec.describe Dog, type: :model do
  describe "Create cat Validations" do
    it "must contain an name" do
      dog = Dog.create age:42, enjoys:'surfing on the beach with all the bro cats', image:'https://wp.usatodaysports.com/wp-content/uploads/sites/88/2020/06/screen-shot-2020-06-03-at-9.47.38-am.jpg'
      expect(dog.errors[:name]).to_not be_empty
    end
    it "must contain an age" do
      dog = Dog.create name:'Toby Keith', enjoys:'surfing on the beach with all the bro cats', image:'https://wp.usatodaysports.com/wp-content/uploads/sites/88/2020/06/screen-shot-2020-06-03-at-9.47.38-am.jpg'
      expect(dog.errors[:age]).to_not be_empty
    end
    it "must contain an enjoys" do
      dog = Dog.create name:'Toby Keith', age:42, image:'https://wp.usatodaysports.com/wp-content/uploads/sites/88/2020/06/screen-shot-2020-06-03-at-9.47.38-am.jpg'
     
      expect(dog.errors[:enjoys]).to_not be_empty
    end
    it "must contain an image" do
      dog = Dog.create name:'Toby Keith', age:42, enjoys:'surfing on the beach with all the bro cats'
      expect(dog.errors[:image]).to_not be_empty
    end
    it "enjoys must have minimum length of ten" do
      dog = Dog.create name:'Toby Keith', age:42,enjoys:'surfing', image:'https://wp.usatodaysports.com/wp-content/uploads/sites/88/2020/06/screen-shot-2020-06-03-at-9.47.38-am.jpg'
     
      expect(dog.errors[:enjoys]).to_not be_empty
    end
  end
    
end