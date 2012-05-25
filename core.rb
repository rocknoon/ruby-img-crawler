require 'net/http'
require 'json'

def aContent(uri)

	html = Net::HTTP.get(uri, '/');
	result = {};	
	html.scan(/<img.*\ssrc=('|")([^'"]+\.(jpg|gif|png|jpeg))\1/){ | item |
		symbol =  Digest::SHA1.hexdigest(item[1] ).to_sym();
		if result[symbol] === nil
			result[symbol] = item[1];
		end
	}
			
	json = result.to_json();
	
	return json;

end
	
