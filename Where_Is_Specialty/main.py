import pandas as pd
from bs4 import BeautifulSoup as bs
import urllib.request
import urllib.parse
import re

# 블랙워터이슈 - 스페셜티카페 - 서울 url
# 'https://bwissue.com/index.php?mid=cafeinfo&category=141894&page='

def cafeInfo(cafe):
    title = location = website = ''
    title = cafe.select_one('a.subject').text
    for extra in cafe.select('p.extra'):
        if extra.strong.text[:2] == '위치':
            location = extra.text[4:]
        if extra.strong.text[:4] == '웹사이트':
            website = extra.text[6:]
    return title, location, website

cafe_list = []
for index in range(1,16):
    try:
        url = 'https://bwissue.com/index.php?mid=cafeinfo&category=141894&page='+str(index)
        html = bs(urllib.request.urlopen(url).read().decode('utf-8'), 'html.parser')
        cafes = html.select('div.cover_info')
        for cafe in cafes:
            cafe_list.append(cafeInfo(cafe))
    except:
        print('error page : ' + str(index))
df = pd.DataFrame(cafe_list, columns=['title', 'location', 'website'])

def I_want_there(location, want='서울'):
    if want[-1]=='동' or want[-1]=='구' or want[-1]=='로':
        want = want[:-1]
    if re.search(want,location) is not None:
        return True
    else:
        return False
    
print(df[df.location.agg(I_want_there, want='역삼동')])
