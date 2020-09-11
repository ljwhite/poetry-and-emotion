class SearchController < ApplicationController

  def index
    author = params["author"]
    @poems = SearchResult.poems(author)
  end
end
