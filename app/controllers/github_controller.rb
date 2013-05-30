class GithubController < ApplicationController

  attr_accessor :github
  private :github

  def index
    info = parse_url(params[:repositoryURL])
    github = Github.new :client_id => '942e65ee8b3ba57761ea', :client_secret => 'd464b55fbe4b80f280a255a10a1688658eacf34f', :oauth_token => 'f7b2c2a6af6ba7039bc95fc5809ec4118a2dc1bc'
    @commits_list = fetch_commits_data(github,info[:repo_name],info[:owner],params[:startDate],params[:endDate])
  end

  private

  def parse_url(repository_url)
    url = repository_url.partition("//")[2].split("/")
    url[2].split(".")
    return {:owner => url[1], :repo_name=>url[2].split(".")[0]}
  end

  def get_repo_branches(git_connection,repo_name,owner)
    branches_info = {}
    all_branches = git_connection.repos.list_branches owner,repo_name
    all_branches.body.each do |branch|
      branches_info["#{branch.name}".to_s] = "#{branch.commit.url}"
    end
    return branches_info
  end

  def fetch_commits_data(git_connection,repo_name,owner,start_date,end_date)
        commits_list={}
        branches = get_repo_branches(git_connection,repo_name,owner) 
        if (start_date=="" and end_date=="")
          branches.keys.each do |branch_name|
            commits_list["#{branch_name}"]  = (git_connection.repos.commits.list owner, repo_name, :sha => branch_name)
          end
        elsif (start_date == "" and end_date != "")
          branches.keys.each do |branch_name|
            commits_list["#{branch_name}"]  = (git_connection.repos.commits.list owner,repo_name,:until => "#{end_date}", :sha => branch_name)
          end
        elsif (start_date != "" and end_date == "")
          branches.keys.each do |branch_name|
            commits_list["#{branch_name}"]  = (git_connection.repos.commits.list owner,repo_name, :since => "#{start_date}", :sha => branch_name)
          end
        else
          branches.keys.each do |branch_name|
              commits_list["#{branch_name}"]  = (git_connection.repos.commits.list owner,repo_name, :since => "#{start_date}", :until => "#{end_date}", :sha => branch_name)
          end
        end      
    return commits_list
  end

  def authorize
    github = Github.new :client_id => '942e65ee8b3ba57761ea', :client_secret => 'd464b55fbe4b80f280a255a10a1688658eacf34f'
    address = github.authorize_url scope: 'repo'
    redirect_to address
    return github
  end

  def callback
    authorization_code = params[:code]
    access_token = github.get_token authorization_code
    access_token.token   # => returns token value
  end

end