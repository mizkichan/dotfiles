#!/usr/bin/env python3
import datetime
import sys
import time

import netifaces

while True:
    items = list()

    ip_addrs = list()
    for iface in netifaces.interfaces():
        addrs = netifaces.ifaddresses(iface)
        for family in addrs:
            if family is netifaces.AF_INET and 'peer' not in addrs[family][0]:
                ip_addrs.append('{}: {}'.format(iface, addrs[family][0]['addr']))  # NOTE: 0 じゃまずいかも
    items.append(', '.join(ip_addrs))

    date = datetime.datetime.now().strftime('%Y/%m/%d %H:%M:%S')
    items.append(date)

    sys.stdout.write(' | '.join(items) + '\n')
    sys.stdout.flush()

    time.sleep(1)