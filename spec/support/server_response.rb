module ServerResponse
  def server_response
    fixture_path = File.join(File.dirname(__FILE__), '..', 'fixtures')
    fname = File.join(fixture_path, *response_file)
    File.read(fname)
  end

  def response_hash
    @response_hash ||= MultiJson.load(server_response)
    @response_hash[collection_node][0]
  end
end
