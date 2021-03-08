import urllib.request, json
from  configparser import ConfigParser
import requests

def get_config(fn):
 parser = ConfigParser()
 parser.read(fn)
 api_key = parser.items('api_key')
 return {key: value for key, value in api_key}
 
conf = get_config('config.ini')


tag1 = str(input()).strip()
tag2 = str(input()).strip()
#key for API - enter a valid key by making a
key=  conf.get('key')

#leave string blank for images and write videos/ for videos
output = '/' + ''

url = 'https://pixabay.com/api'+output+'?key='+key+'&q='+tag1+'+'+tag2
print(url)

res = urllib.request.urlopen(url).read().decode('utf-8')

posts = json.loads(res)['hits']
for post in posts:
    if post['comments'] > 10:
    	print(post)
    	print('Comments: ', post['comments'], '\n')
