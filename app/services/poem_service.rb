class PoemService

  def self.find_poems_by_author(author)
    response = conn.get("author,poemcount/#{author};10")
    collection = JSON.parse(response.body, symbolize_names: true)
    poems = collection.map do |poem|
      OpenStruct.new(poem)
    end
  end

  private

  def self.conn
    @conn ||= Faraday.new(
      url: "https://poetrydb.org"
    )
  end
end
