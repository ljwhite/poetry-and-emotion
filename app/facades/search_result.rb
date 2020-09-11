class SearchResult

  def self.poems(author)
    poems = PoemService.find_poems_by_author(author)
    TonesService.find_tones_of_poem(poems)
  end
end
