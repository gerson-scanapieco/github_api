require 'spec_helper'

describe GithubController do

  describe "GET #index" do

    context "with valid attributes" do

      it "renders the github repository commits between the given dates" do
       get :index, repositoryURL: "git://github.com/mojombo/grit.git", startDate: "08-06-2011", endDate: "10-06-2011" 
       #page.should have_content "https://github.com/mojombo/grit/commit/ff015074ef35bd94cba943f9c0f98e161ab5851c"
      end

      it "renders all the github repository commits" do
        get :index, repositoryURL: "git://github.com/mojombo/grit.git", startDate: "", endDate: ""
        #page.should have_content "https://github.com/mojombo/grit/commit/ff015074ef35bd94cba943f9c0f98e161ab5851c"
      end

      it "renders all the github repository commits starting at the given date" do
        get :index, repositoryURL: "git://github.com/mojombo/grit.git", startDate: "", endDate: ""
        #page.should have_content "https://github.com/mojombo/grit/commit/ff015074ef35bd94cba943f9c0f98e161ab5851c"
      end

      it "renders all the github repository commits until the given date" do
        get :index, repositoryURL: "git://github.com/mojombo/grit.git", startDate: "", endDate: ""
        #page.should have_content "https://github.com/mojombo/grit/commit/ff015074ef35bd94cba943f9c0f98e161ab5851c"
      end
    end

    context "with invalid attributes" do

      it "shows a error message about the incorrect url" do
        get :index, repositoryURL: "34341341414"
        #page.should have_content "Invalid URL"
      end

      it "shows a error message about the incorrect dates" do
        get :index, repositoryURL: "git://github.com/mojombo/grit.git", startDate: "15-02-2013", endDate: "12-02-2013"
        #page.should have_content "Invalid dates"
      end

      it "renders a page warning that the repository doesnt exist" do 
        get :index, repositoryURL: "git://github.com/abc!@!@/)().git", startDate: "", endDate: ""
        #page.should have_content "This repository doesnt exist"
      end
    end
  end
end