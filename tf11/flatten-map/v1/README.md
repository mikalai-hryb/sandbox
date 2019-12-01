# Flatten Map

Sometimes it’s convenient to store information in a nested _JSON_ file on S3 or locally. But Terraform does not allow to pass nested map as an input variable for now. This module helps to get around this problem. It converts nested _JSON_ file into a flatten map.

## Variables

### Required

#### key

An S3 key or a local path to the _JSON_ file.

The key will be considered as s3 key if the bucket specified otherwise a local path.

### Optional

#### bucket
Default is `""`

An S3 Bucket name.

#### sort_keys
Default is `"false"`

If `"true"` the keys in the flatten map will be sorted.

## Outputs

#### Value

A flatten map.

```
example.json
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

output
{
    "environment__name": "dev",
    "environment__dayOfWeek": "7",
    "aws__subscriptions__0__name": "first",
    "aws__subscriptions__1__name": "second",
    "aws__someFlag": "true",
}
"""
```

## Sample

```hcl
module "local_flatten_config" {
  source = ".../modules/flatten-config/v1"

  key    = "../config.json"
}

module "s3_flatten_config" {
  source = ".../modules/flatten-config/v1"

  bucket = "test-bucket"
  key    = "qa1/config.json"
}

# usage of the flatten config
resource "aws_sns_topic" "alerts_topic" {
  name = "${module.s3_flatten_config.value["aws__sns__alertsTopicName"]}"
}
```
