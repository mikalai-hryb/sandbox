import boto3
import base64
from botocore.exceptions import ClientError


def form_nested_dict(dct, separator=':'):
    """
    Converts a flatten dict to a nested.

    Args:
        dct: A dict, the keys are strings with the separator in them.
        separator: A separator used in the dct keys.

    Return:
        A nested dict. Keys will be split by separator.
        They will be used as nested keys.

    To use:
    >>>dct = {
      "region": "v1",
      "aws:dynamo:table:name": "v2",
      "usps:username": "v3"
    }
    >>>form_nested_dict(dct)
    {
      'aws':{
        'dynamo':{
          'table':{
            'name':'v2'
          }
        }
      },
      'region':'v1',
      'usps':{
        'username':'v3'
      }
    }
    """
    result = {}

    for key, value in dct.items():
        key_value_lst = key.split(separator)
        key_value_lst.append(value)
        result = get_nested(result, key_value_lst)

    return result


def get_nested(dct, lst):
    """
    Expands the given dict with the keys from the list.

    All keys except the last will be mapped as nested keys.
    The last value will the value of the last key.

    Args:
        dct: A dict.
        lst: A sequence of strings except the last. The last is any type.

    Returns:
        The nested dict.

    To use:
    >>>print(get_nested({'a':{'m': 'v1'}}, ['a', 'b', 'c', 'v2']))
    {
      'a':{
        'b':{
          'c':'v2'
        },
        'm':'v1'
      }
    }
    """
    if len(lst) < 2:
        raise ValueError('The list length must be greater than or equal to 2.')

    key, *other_keys = lst

    if len(other_keys) == 1:
        dct[key] = other_keys[0]
        return dct

    nest = dct.get(key)
    if isinstance(nest, dict):
        dct[key] = get_nested(nest, other_keys)
    elif nest is None:
        dct[key] = get_nested({}, other_keys)
    return dct


def get_secret(self, secret_name, region_name='us-west-1'):
    # Create a Secrets Manager client
    session = boto3.session.Session()
    secret_client = session.client(
        service_name='secretsmanager',
        region_name=region_name,
    )

    # In this sample we only handle the specific exceptions for the 'GetSecretValue' API.
    # See https://docs.aws.amazon.com/secretsmanager/latest/apireference/API_GetSecretValue.html
    # We rethrow the exception by default.

    try:
        get_secret_value_response = secret_client.get_secret_value(
            SecretId=secret_name
        )
    except ClientError as e:
        if e.response['Error']['Code'] == 'DecryptionFailureException':
            # Secrets Manager can't decrypt the protected secret text using the provided KMS key.
            # Deal with the exception here, and/or rethrow at your discretion.
            raise e
        elif e.response['Error']['Code'] == 'InternalServiceErrorException':
            # An error occurred on the server side.
            # Deal with the exception here, and/or rethrow at your discretion.
            raise e
        elif e.response['Error']['Code'] == 'InvalidParameterException':
            # You provided an invalid value for a parameter.
            # Deal with the exception here, and/or rethrow at your discretion.
            raise e
        elif e.response['Error']['Code'] == 'InvalidRequestException':
            # You provided a parameter value that is not valid for the current state of the resource.
            # Deal with the exception here, and/or rethrow at your discretion.
            raise e
        elif e.response['Error']['Code'] == 'ResourceNotFoundException':
            # We can't find the resource that you asked for.
            # Deal with the exception here, and/or rethrow at your discretion.
            raise e
    else:
        # Decrypts secret using the associated KMS CMK.
        # Depending on whether the secret is a string or binary, one of these fields will be populated.
        if 'SecretString' in get_secret_value_response:
            secret = get_secret_value_response['SecretString']
        else:
            decoded_binary_secret = base64.b64decode(
                get_secret_value_response['SecretBinary'])

    return secret
