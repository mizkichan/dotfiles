#!/usr/bin/env python3
import datetime
import sys
import time

import netifaces

while True:
    items = []

    interfaces = {}
    for ifname in netifaces.interfaces():
        ifaddresses = netifaces.ifaddresses(ifname)
        addresses = []
        for family, interface in ifaddresses.items():
            if family not in (netifaces.AF_INET, netifaces.AF_INET6):
                continue
            for address in interface:
                if 'broadcast' not in address:
                    continue
                addresses.append(address['addr'])
        if len(addresses) > 0:
            interfaces[ifname] = addresses

    ipaddrs = ', '.join(k + ' [' + ', '.join(v) + ']' for k, v in interfaces.items())
    items.append(ipaddrs)

    date = datetime.datetime.now().strftime('%Y/%m/%d %H:%M:%S')
    items.append(date)

    sys.stdout.write(' | '.join(items) + ' | \n')
    sys.stdout.flush()

    time.sleep(1)
