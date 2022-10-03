require "spec_helper"
require "rack/test"
require_relative '../../app'

RSpec.describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET to /hello" do
    it "returns 200 OK with the right content" do
      response = get("/hello", name: "Ollie")

      expect(response.status).to eq(200)
      expect(response.body).to eq("Hello Ollie")
    end
  end

  context "POST to /submit" do
    it "returns 200 OK with the right content" do
      response = post("/submit", name: "Dana", message: "Hello world!") # request with body params

      expect(response.status).to eq(200)
      expect(response.body).to eq("Thanks Dana, you sent this message: Hello world!")
    end
  end

  context "GET /names" do
    it "returns 200 OK with the right content" do
      response = get("/names", names: "Julia, Kate, Ollie")
      
      expect(response.status).to eq(200)
      expect(response.body).to eq("Julia, Kate, Ollie")
    end
  end

  context "POST /sort-names" do
    it 'returns 200 OK and sorts names alphabetically' do
      response = post('/sort-names', names: "Joe,Alice,Zoe,Julia,Kieran")

      expect(response.status).to eq(200)
      expect(response.body).to eq("Alice,Joe,Julia,Kieran,Zoe")
    end
  end
end


      