require 'rails_helper'

RSpec.describe "Dogs", type: :request do
  describe "GET /index" do
    it 'return a list of all dogs' do
      Dog.create(
        name: 'Toast',
        age: 2,
        enjoys: 'allll the attention',
        image: 'http://www.catpics.com'
      )
      get '/dogs'
      dog = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(dog.length).to eq(1)
    end
  end

  describe "POST /create" do
    it 'can create a dog' do
      dog_params = {
        dog: {
          name: 'Toast',
          age: 2,
          enjoys: 'allll the attention',
          image: 'http://www.catpics.com'
        }
      }
      post '/dogs', params: dog_params
      dog = Dog.first
      expect(response).to have_http_status(200)
      expect(dog.name).to eq('Toast')
      expect(dog.age).to eq(2)
      expect(dog.enjoys).to eq('allll the attention')
      expect(dog.image).to eq('http://www.catpics.com')
    end
  end

  describe "PATCH /update" do
    it 'can update an existing dog' do
      dog_params = {
        dog: {
          name: 'Toast',
          age: 2,
          enjoys: 'allll the attention',
          image: 'http://www.catpics.com'
        }
      }
      post '/dogs', params: dog_params
      dog = Dog.first

      update_dog_params = {
        dog: {
          name: 'Toast',
          age: 3,
          enjoys: 'allll the attention',
          image: 'http://www.catpics.com'
        }
      }
      patch "/dogs/#{dog.id}", params: update_dog_params
      updated_dog = Dog.find(dog.id)
      expect(response).to have_http_status(200)
      expect(updated_dog.age).to eq(3)
    end
  end
end