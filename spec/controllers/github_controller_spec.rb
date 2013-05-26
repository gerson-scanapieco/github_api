require 'spec_helper'

describe GithubController do

  describe "GET #index" do

    context "with valid attributes" do

      #TODO Fix this Test
      it "renders the github repository commits" do
        repo = FactoryGirl.build(:repository)
        params = {repositoryUrl: repo.rul, startDate: repo.start_date, endDate: end_date}
        get :index, params
        response.should render_template :index
      end

    end

    context "with invalid attributes" do

      it "shows a error message about the incorrect url" do
      end

      it "shows a error message about the incorrect dates" do
      end

      it "renders a page warning that the repository doesnt exist" do 
      end

    end
  end
end