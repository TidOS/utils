#!/usr/bin/env python3
#prints the first desktop thread it finds on /g/'s thread number

import requests
import json
from fuzzywuzzy import fuzz
from fuzzywuzzy import process

def match(comment):
    matchscore = fuzz.partial_ratio("desktop thread", comment)
    if matchscore > 85:
#        print("comment: " + comment + " looks like a desktop thread")
#        print("score is " + str(matchscore))
        return True
    return False

def gen_chan():
    global r
    r = requests.get('https://a.4cdn.org/g/catalog.json')
    r = r.json()
    for idx, page in enumerate(r):
        for thread in r[idx]['threads']:
            yield thread

def get_threads(key: str, default='NaN'):
    return threads.get(key,default)

for threads in gen_chan():
    com = get_threads('com')
    sub = get_threads('sub')
    no = get_threads('no')
    #desktop thread search string
    #if "desktop threa" in com.lower()or "desktop threa" in sub.lower() or "desktop brea" in com.lower() or "desktop brea" in sub.lower():
    if match(com.lower()) or match(sub.lower()):
        print(str(no))
        exit(0)

print("-1")
        


