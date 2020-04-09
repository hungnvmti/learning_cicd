require 'rails_helper'

# Change this ArticlesController to your project
RSpec.describe GreetingController, type: :controller do

    # This should return the minimal set of attributes required to create a valid
    # Article. As you add validations to Article, be sure to adjust the attributes here as well.
    let(:valid_attributes) {
        { :title => "Test title!", :description => "This is a test description" }
    }

    let(:valid_session) { {} }

    describe "GET #index" do
        it "returns a success response" do
            Greeting.create! valid_attributes
            get :index, params: {}, session: valid_session
            expect(response).to be_successful # be_successful expects a HTTP Status code of 200
        end
    end
end