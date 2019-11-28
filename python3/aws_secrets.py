from pprint import pprint

or_dct = {'a:b:c:d': 2, 'e:f:h': 3}

exz = ['a', 'b', 'c', 'd', 2]
exz2 = ['a', 'k', 3]


ex = {
  "aftership:key": "4c552db3-8604-4d2d-9a50-2d3adb949b19",
  "usps:username": "josh.long@smiledirectclub.com",
  "usps:password": "Y90fvGp3nDq64My8qcCFUvwROWivhO",
  "usps:mid": "901811968",
  "barrett:archiveFiles": "true",
  "barrett:gateway": "s3",
  "barrett:fileExtension": ".txt",
  "barrett:fulfillerCode": "3PL",
  "barrett:trackingFileBucket": "sdc-fulfillment",
  "tnt:archiveFiles": "true",
  "tnt:gateway": "s3",
  "tnt:fileExtension": ".ECS",
  "tnt:fulfillerCode": "TNT",
  "tnt:trackingFileBucket": "sdc-fulfillment"
}

def get_nest(dct, lst):
    *keys, value = lst
    key = keys[0]

    if len(keys) == 1:
        dct[key] = value
        return dct

    nest = dct.get(key)
    if isinstance(nest, dict):
        dct[key] = get_nest(nest, lst[1:])
    elif nest is None:
        dct[key] = get_nest({}, lst[1:])
    return dct

# a = get_nest(result, exz)
# a = get_nest(a, exz2)
# pprint(a)

result = {}
for k, i in ex.items():
    r = k.split(':')
    r.append(i)
    result = get_nest(result, r)

pprint(result)