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
    github = Github.new #:client_id => '942e65ee8b3ba57761ea', :client_secret => 'd464b55fbe4b80f280a255a10a1688658eacf34f'
    #github.authorize_url :redirect_uri => 'http://localhost', :scope => 'repo'

    if !params[:startDate] == "" and !params[:endDate] == "" 
      @commits_list = github.repos.commits.list info[:user], info[:repo_name], :since => params[:startDate], :until => params[:endDate], media: 'json'
    else
      @commits_list = github.repos.commits.list info[:user], info[:repo_name], media: 'json'
    end
     #@hash = JSON.parse(@commits_list.body)
     @list = Octokit.list_commits("pengwynn/octokit")
  end
end