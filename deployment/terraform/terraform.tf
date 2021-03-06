provider "aws" {
    region = "eu-west-1"
    profile = "dow-lab7"
}

provider "aws" {
    alias = "slave1"
    region = "eu-west-1"
    profile = "dow-lab6"
}

data "aws_caller_identity" "master" {}

module "ddb" {
    source = "modules/ddb"
    s3bucket = "${var.s3bucket}"
    resources-prefix = "${var.resources-prefix}"
    tags = "${var.tags}"
}

module "roles-master" {
    source = "modules/roles-master"
    s3bucket = "${var.s3bucket}"
    s3BackupBucket = "${var.s3BackupBucket}"
    identificationIAMRole = "${var.identificationIAMRole}"
    identificationCrossAccountIAMRole = "${var.identificationCrossAccountIAMRole}"
    reportingRemediationIAMRole = "${var.reportingRemediationIAMRole}"
    reportingRemediationIAMCrossAccountRole = "${var.reportingRemediationIAMCrossAccountRole}"
    resources-prefix = "${var.resources-prefix}"
}

module "roles-crossaccount" {
    source = "modules/roles-crossaccount"
    name = "slave1"
    providers = {
        aws = "aws.slave1"
    }
    masterAccountId = "${data.aws_caller_identity.master.account_id}"
    identificationCrossAccountIAMRole = "${var.identificationCrossAccountIAMRole}"
    reportingRemediationIAMCrossAccountRole = "${var.reportingRemediationIAMCrossAccountRole}"
    resources-prefix = "${var.resources-prefix}"
}

module "identification" {
    source = "modules/identification"
    identificationCheckRateExpression = "${var.identificationCheckRateExpression}"
    s3bucket = "${var.s3bucket}"
    identificationIAMRole = "${var.identificationIAMRole}"
    resources-prefix = "${var.resources-prefix}"
    tags = "${var.tags}"
}

module "reporting-remediation" {
    source = "modules/reporting-remediation"
    s3bucket = "${var.s3bucket}"
    keyPair = "${var.keyPair}"
    ec2InstanceType = "${var.ec2InstanceType}"
    vpcId = "${var.vpcId}"
    subnet = "${var.subnet}"
    reportingRemediationIAMRole = "${var.reportingRemediationIAMRole}"
    lambdaLogsForwarderArn = "${module.identification.lambdaLogsForwarderArn}"
    resources-prefix = "${var.resources-prefix}"
    tags = "${var.tags}"
}