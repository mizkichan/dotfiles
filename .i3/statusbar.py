#!/usr/bin/env python3
import datetime
import sys
import time
import random

import netifaces

spinner_chars = {
    ' ': '▖▗▘▝',
    '▀': '▘▛▜▝',
    '▄': '▖▗▙▟',
    '█': '▙▛▜▟',
    '▌': '▖▘▙▛',
    '▐': '▗▜▝▟',
    '▖': ' ▄▌▞',
    '▗': ' ▄▐▚',
    '▘': ' ▀▌▚',
    '▙': '▄█▌▚',
    '▚': '▗▘▙▜',
    '▛': '▀█▌▞',
    '▜': '▀█▐▚',
    '▝': ' ▀▐▞',
    '▞': '▖▛▝▟',
    '▟': '▄█▐▞',
}

spinner = ' '

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

    spinner = random.choice(spinner_chars[spinner])

    sys.stdout.write(' | '.join(items) + ' {}\n'.format(spinner))
    sys.stdout.flush()

    time.sleep(1)
