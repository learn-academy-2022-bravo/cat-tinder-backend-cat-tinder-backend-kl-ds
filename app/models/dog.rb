class Dog < ApplicationRecord
    validates :name, :age, presence: true
end
