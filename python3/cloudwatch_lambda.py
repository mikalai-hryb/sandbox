import boto3

session = boto3.Session(profile_name='smiledirectclub:Developer')
client = session.client('logs', region_name='us-west-1')
response = client.filter_log_events(
    logGroupName='/aws/lambda/prod-tracking-service-aftership-api-handler',
    startTime=1598918400000,
    endTime=1605830400000,
    filterPattern='ERROR',
    interleaved=True|False
)
print(response)
with open('temp.txt', 'w+') as f:
    f.write(str(response))
