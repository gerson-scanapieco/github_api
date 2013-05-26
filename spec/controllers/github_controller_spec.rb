require 'spec_helper'

describe GithubController do

  describe "GET #index" do

    context "with valid attributes" do

      it "renders the github repository commits" do
        repo = FactoryGirl.build(:repository)
        params = {repositoryUrl: repo.rul, startDate: repo.start_date, endDate: end_date}
        get :index params
        response.should render_template :index
      end

      it "validates that the dates are correct" do
      end

      it "parses the string coming from the form" do
      end
    end

    context "with invalid attributes" do

      it "does not parse correctly the url" do
      end

      it "shows a error message about the incorrect dates" do
      end

      it "renders a page warning that the repository doesnt exist"
      end
    end
  end
end