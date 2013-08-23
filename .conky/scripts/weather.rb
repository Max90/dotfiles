require 'rest-client'
require 'json'
require 'yaml'

secrets = YAML.load_file(ENV['HOME']+'/.dotfiles/secrets.yml')
 # required by producing your own API key from http://www.wunderground.com/weather/api/
api_key = secrets['wunderground']['api_key']

url = "http://api.wunderground.com/api/#{api_key}/conditions/q/NC/Carrboro.json"
file = '/tmp/weather.txt'

res = RestClient.get url
parsed_json = JSON.parse(res)
temp = parsed_json['current_observation']['temp_c']
city = parsed_json['current_observation']['display_location']['city']
humidity = parsed_json['current_observation']['relative_humidity']
feelslike = parsed_json['current_observation']['feelslike_c']
visibility = parsed_json['current_observation']['visibility_km']
weather = parsed_json['current_observation']['weather']
File.open(file, 'w') do |f|
  f.write("#{city}\n")
  f.write("#{weather}\n")
  f.write("#{temp}\n")
  f.write("#{humidity}\n")
  f.write("#{feelslike}\n")
  f.write("#{visibility}\n")
end
