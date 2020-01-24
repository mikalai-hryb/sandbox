# SNS SQS Subscription

## Supported SNS Regions

* us-west-1
* us-west-2
* us-east-1
* us-east-2

## Variables

### Required

#### sns_arns

Map of SNS Topic ARNs for given queue to be subscribed to.

Keys are the region and values are a string of comma separated arns.

```
sns_arns = {
  us-west-1 = "arn1,arn2"
  us-east-2 = "arn3"
}
```

#### sns_counts

Map of SNS Topic ARN counts per region.  This is a calculated count workaround value to be eliminated with HCL2.

```
sns_arns = {
  us-west-1 = 2
  us-east-2 = 1
}
```

#### sqs_arn

SQS Queue ARN

#### sqs_url

SQS Queue URL

### Optional

#### sqs_region

Default: us-west-1

Specify when the SQS queue is in a region other than us-west-1.

## Sample

```hcl
module "subscriptions" {
  source = "git@github.com:CamelotVG/sdc-terraform-modules//sns-sqs-subscriptions/v1"

  sns_arns = {
    us-west-1 = "${module.sns1.arn},${module.sns2.arn}"
  }
  
  sns_counts = {
    us-west-1 = 2
  }

  sqs_arn = "${module.sqs.arn}"
  sqs_url = "${module.sqs.url}"
}
```

See [test definitions](../tests/main.tf) for additional samples