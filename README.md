# workstation
IaC and EaC for AWS EC2 based workstation

## Connecting
1. Ensure that you have the session manager plugin for the AWS cli installed: https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html
2. Start a session (use your instance id as the target value):

       aws ssm start-session \
           --target i-123456789 \
           --document-name AWS-StartPortForwardingSession \
           --parameters '{"portNumber":["3389"], "localPortNumber":["56789"]}'
3. Connect using a remote desktop client to `localhost:56789`