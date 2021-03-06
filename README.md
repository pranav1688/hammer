![HammerLogo](docs/images/dow-jones-hammer-logo.png)

## Overview

Dow Jones Hammer is a multi-account cloud security tool for AWS. It identifies misconfigurations and insecure data exposures within most popular AWS resources, across all regions and accounts. It has near real-time reporting capabilities (e.g. JIRA, Slack) to provide quick feedback to engineers and can perform auto-remediation of some misconfigurations. This helps to protect products deployed on cloud by creating secure guardrails.

![HammerLifecycleDiagram](docs/images/Architecture.png)

## Documentation
Dow Jones Hammer documentation is available via GitHub Pages at [https://dowjones.github.io/hammer/](https://dowjones.github.io/hammer/).

## Security features
* [Insecure Services](https://dowjones.github.io/hammer/playbook2_insecure_services.html)
* [S3 ACL Public Access](https://dowjones.github.io/hammer/playbook1_s3_public_buckets_acl.html)
* [S3 Policy Public Access](https://dowjones.github.io/hammer/playbook5_s3_public_buckets_policy.html)
* [IAM User Inactive Keys](https://dowjones.github.io/hammer/playbook3_inactive_user_keys.html)
* [IAM User Keys Rotation](https://dowjones.github.io/hammer/playbook4_keysrotation.html)
* [CloudTrail Logging Issues](https://dowjones.github.io/hammer/playbook6_cloudtrail.html)
* [EBS Unencrypted Volumes](https://dowjones.github.io/hammer/playbook7_ebs_unencrypted_volumes.html)
* [EBS Public Snapshots](https://dowjones.github.io/hammer/playbook8_ebs_snapshots_public.html)
* [RDS Public Snapshots](https://dowjones.github.io/hammer/playbook9_rds_snapshots_public.html)

## Technologies
* Python 3.6
* AWS (Lambda, Dynamodb, EC2, SNS, CloudWatch, CloudFormation)
* Terraform
* JIRA
* Slack

## Contact Us
Feel free to create [issue report](https://github.com/dowjones/hammer/issues/new), pull request or just email us at [hammer@dowjones.com](mailto:hammer@dowjones.com) with any other questions or concerns you have.
