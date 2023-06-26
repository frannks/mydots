#!/usr/bin/env python3

# pip install --user pyshorteners

import os
import pyshorteners

try:
    os.system('clear')
    url = input('Cole a url aqui:\n\n')
    s = pyshorteners.Shortener()
    shortUrl = s.tinyurl.short(url)
    print(f'\nUrl encurtada: {shortUrl}')

except KeyboardInterrupt:
    os.system('clear')
    os.exit()
