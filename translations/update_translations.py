#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os.path
import sys
import configparser
import requests
import json

URL = 'https://www.transifex.com/api/2/project/harbour-fileman/languages/'
TRC_PATH = os.path.join(os.path.expanduser('~'), '.transifexrc')
TEMPL = '''\
ListElement {{
    locale: "{}"
    coordinators: [{}]
    translators: [{}]
    reviewers: [{}]
}}
'''

def get_participants(array):
    res = ','.join([ '\n        ListElement {{ name: "{}" }}'.format(p) for p in array ])
    return '{}\n    '.format(res) if len(res) else ''

def main():
    # Getting Transifex user name and password
    if len(sys.argv) >= 3:
        tlogin = sys.argv[1]
        tpassword = sys.argv[2]
    elif os.path.isfile(TRC_PATH):
        print('Fetching credentials from {}'.format(TRC_PATH))
        trc = configparser.ConfigParser()
        try:
            trc.read(TRC_PATH)
            section = trc['https://www.transifex.com']
            tlogin = section['username']
            tpassword = section['password']
        except Exception as e:
            print('Error reading .transifexrc: {}'.format(e))
            sys.exit(1)
    else:
        print('\n    Usage: update_translations.py <user> <password>\n')
    # Getting data
    print('Fetching {}\n'.format(URL))
    reply = requests.get(URL, auth=(tlogin, tpassword)).content
    data = json.loads(reply.decode('UTF-8'))
    for tr in data:
        print(TEMPL.format(
            tr['language_code'],
            get_participants(tr['coordinators']),
            get_participants(tr['translators']),
            get_participants(tr['reviewers'])))

if __name__ == '__main__':
    main()
