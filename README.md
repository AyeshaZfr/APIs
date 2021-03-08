# Homework 07

## Part 1 Queries

## Part 2 Using an API

### Link to API documentation: 
https://pixabay.com/api/docs/

### Request Method and Paths of API URLs Used: 

GET method has been used to request for data. The response is formatted in json. User has to log in and make an account to get a iunique API KEY.

### Example Format of Response:

If I run the following code: 
"""""""
import urllib.request, json
import requests

color = 'orange'
item = 'fruit'

key=  '19171779-76f19cdffb0843979c8740413'
url = 'https://pixabay.com/api/?key='+key+'&q='+item+'+'+color
print(url)

res = urllib.request.urlopen(url).read().decode('utf-8')

posts = json.loads(res)['hits']
for post in posts:
    if post['comments'] > 100 and post['imageSize'] > 600000:
        print(post['comments'])
        
        
"""""""""""""
I get the following output
```
Response goes here:

https://pixabay.com/api/?key=19171779-76f19cdffb0843979c8740413&q=fruit+orange

{'id': 1614822, 'pageURL': 'https://pixabay.com/photos/fresh-orange-juice-squeezed-1614822/', 'type': 'photo', 'tags': 'fresh orange juice, squeezed, refreshing', 'previewURL': 'https://cdn.pixabay.com/photo/2016/08/23/15/52/fresh-orange-juice-1614822_150.jpg', 'previewWidth': 150, 'previewHeight': 99, 'webformatURL': 'https://pixabay.com/get/57e6d4474250ae14f1dc846096293e7f123ed9e25a4c704f752a7cd7914bc059_640.jpg', 'webformatWidth': 640, 'webformatHeight': 426, 'largeImageURL': 'https://pixabay.com/get/57e6d4474250ae14f6da8c7dda7936771438dfe254586c48732f7ed3944bc35db9_1280.jpg', 'imageWidth': 5472, 'imageHeight': 3648, 'imageSize': 2665520, 'views': 90715, 'downloads': 51374, 'favorites': 263, 'likes': 257, 'comments': 107, 'user_id': 282134, 'user': 'stevepb', 'userImageURL': 'https://cdn.pixabay.com/user/2015/09/15/20-33-27-452_250x250.jpg'}
```

### Authentication Requirements
We are requored to login/sign up to get a unique api key. This key is then used to retrienve data. The data retrieved has multiple uses, for  example we can filter out all the images of a certain fruit or all the images that have a paticualr color and a paticular size. We can also work with videos and filter out certai videos.

### Optional Additional Documentation (such as using a pre-built client)
None. 
