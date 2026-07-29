# wmp-terraform-v5


NoSuchVersion: The requested version of service AmazonEC2 does not exist
InvalidHttpRequest: The HTTP request is invalid. Reason: Unable to parse request

These aren't typical Terraform config mistakes — they're the AWS API itself rejecting the request oddly. This usually happens for one of these reasons:

1. Concurrent request collision (most likely)
You're creating 5 security groups simultaneously (via for_each), and Terraform sends them all to the AWS API in parallel. Occasionally, when many similar requests hit the API at once, one gets malformed/corrupted in transit or hits a transient API glitch. This is a known flaky behavior, not a config bug.

Fix — reduce parallelism and retry:

bash:-
terraform apply -parallelism=1
This forces Terraform to create resources one at a time instead of in parallel, which usually clears up this exact class of error.
