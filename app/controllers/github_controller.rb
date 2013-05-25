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
    #params[:startDate] == "" ? @start_date = params[:startDate] : @start_date = "a"
    #params[:endDate] == "" ? @end_date = params[:endDate] : @end_date = "b"
    github = Github.new
    @commits_list = github.repos.commits.list info[:user], info[:repo_name]#, :since => start_date, :until =>end_date
  end

end