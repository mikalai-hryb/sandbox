"""
Load AWS s3 object (json type), flatten it, put it to the stdout.
When flatten it also convert booleans to "true" or "false" and ints to "int".

For example:
{
    "environment": {
        "name": "dev",
        "dayOfWeek": 7,

    },
    "aws": {
        "subscriptions": [
            {"name": "first"},
            {"name": "second"}
        ],
        "someFlag": true
    }

}

Into:
{
    "environment__name": "dev",
    "environment__dayOfWeek": "7",
    "aws__subscriptions__0__name": "first",
    "aws__subscriptions__1__name": "second",
    "aws__someFlag": "true",
}
"""

import sys
import json
import boto3


KEY_SEPARATOR = '__'


if sys.stdin.isatty():
    sys.exit('Expected input {"bucket":"", "key":""}')
else:
    args = json.load(sys.stdin)

s3_bucket = args['bucket']
key = args['key']
sort_keys = args['sort_keys'] == 'true'

if s3_bucket:
    s3 = boto3.resource('s3')
    content_object = s3.Object(bucket_name=s3_bucket, key=key)
    file_content = content_object.get()['Body'].read().decode('utf-8')
else:
    with open(key, 'r') as f:
        file_content = f.read()

json_content = json.loads(file_content)


# https://towardsdatascience.com/how-to-flatten-deeply-nested-json-objects-in-non-recursive-elegant-python-55f96533103d
def flatten_json(nested_json):
    """
        Flatten json object with nested keys into a single level.
        Args:
            nested_json: A nested json object.
        Returns:
            The flattened json object if successful, None otherwise.
    """
    out = {}

    def flatten(x, name=''):
        if type(x) is dict:
            for a in x:
                flatten(x[a], name + a + KEY_SEPARATOR)
        elif type(x) is list:
            i = 0
            for a in x:
                flatten(a, name + str(i) + KEY_SEPARATOR)
                i += 1
        elif type(x) is bool:
            # Terraform 'data.external' block
            # expect booleans in this style "true", "false"
            if x:
                out[name[:-len(KEY_SEPARATOR)]] = 'true'
            out[name[:-len(KEY_SEPARATOR)]] = 'false'
        elif type(x) is int:
            # Terraform 'data.external' block
            # expect ints in this style "1", "2" and so on
            out[name[:-len(KEY_SEPARATOR)]] = str(x)
        else:
            out[name[:-len(KEY_SEPARATOR)]] = x

    flatten(nested_json)
    return out


output = json.dumps(flatten_json(json_content), indent=2, sort_keys=sort_keys)
print(output)
