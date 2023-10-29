#!/usr/bin/python3

# ADD THIS TO POLYBAR!

import subprocess
import json as simplejson

def getNodes(data):
    result = 0
    if data['scratchpad_state'] != 'none':
        result += 1
    if (len(data['nodes']) > 0) or (len(data['floating_nodes']) > 0):
        for node in (data['nodes'] + data['floating_nodes']):
            result += getNodes(node)
    return result

r = subprocess.check_output(["i3-msg", "-t", "get_tree"])
j = simplejson.loads(r)
c = getNodes(j)


if c > 0:
    print("  Scratchpad: %d" % c)
else:
    print(" Scratchpad: %d" % c)
