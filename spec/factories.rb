FactoryGirl.define do

  # Mock to a repository, refers to the parameters coming from the homepage form
  factory :repository do |repo|
    repo.url "git://github.com/gerson-scanapieco/github_app.git"
    repo.start_date "25-05-2013"
    repo.end_date "26-05-2013"
  end

end
  
