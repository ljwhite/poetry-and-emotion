class TonesService

  def self.find_tones_of_poem(poems)
    poems.each do |poem|
      lines = poem.lines.join(', ')
      response = conn.get("/v3/tone") do |req|
        req.params['version'] = "2017-09-21"
        req.params['text'] = lines
      end
      data = JSON.parse(response.body)
      poem_tone = data['document_tone']["tones"].first["tone_id"]
      poem.tone = poem_tone
    end

  end

  private

  def self.conn
    @conn ||= Faraday.new(
      url: "https://api.us-south.tone-analyzer.watson.cloud.ibm.com/instances/",) do |builder|
        builder.basic_auth("apikey", ENV["PASSWORD"])
      end
    end
end
