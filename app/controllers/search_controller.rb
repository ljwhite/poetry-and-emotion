class SearchController < ApplicationController

  def index
    author = params["author"]
    @poems = SearchResult.poems(author)
    binding.pry 
  end
end
