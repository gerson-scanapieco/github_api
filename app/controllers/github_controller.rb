class GithubController < ApplicationController

  attr_accessor :github
  private :github

  def index
    info = parse_url(params[:repositoryURL])
    github = Github.new :client_id => '942e65ee8b3ba57761ea', :client_secret => 'd464b55fbe4b80f280a255a10a1688658eacf34f'
    #github.authorize_url :redirect_uri => 'http://localhost', :scope => 'repo'
    @branches = get_repo_branches(github,info[:repo_name],info[:owner] )
    if (params[:startDate]=="" and params[:endDate]=="")
      @commits_list = github.repos.commits.list info[:owner], info[:repo_name]    
    else
      @commits_list = github.repos.commits.list info[:owner], info[:repo_name], :since => params[:startDate], :until => params[:endDate]
    end
  end

  private

  def parse_url(repository_url)
    url = repository_url.partition("//")[2].split("/")
    url[2].split(".")
    return {:owner => url[1], :repo_name=>url[2].split(".")[0]}
  end

  def get_repo_branches(git_connection,repo_name,owner)
    branches = git_connection.repos.branches(owner,repo_name)
    repo_branches = []
    branches.each do |branch|
      branch_details = git_connection.repos.branch(owner,repo_name, branch.name)
      repo_branches.push(branch_details)
    end
    return repo_branches
  end

end