class GithubController < ApplicationController

  attr_accessor :github
  private :github

  def parse_url(repository_url)
    url = repository_url.partition("//")[2].split("/")
    url[2].split(".")
    return {:user => url[1], :repo_name=>url[2].split(".")[0]}
  end

  def index
    info = parse_url(params[:repositoryURL])
    github = Github.new
    if !params[:startDate] == "" and !params[:endDate] == "" 
      @commits_list = github.repos.commits.list info[:user], info[:repo_name], :since => params[:startDate], :until => params[:endDate]
    else
      @commits_list = github.repos.commits.list info[:user], info[:repo_name]
    end
     @hash = @commits_list.to_s
  end
end