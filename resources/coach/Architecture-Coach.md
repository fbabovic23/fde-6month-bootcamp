# Architecture Practice — Coach File (26 AWS & FDE Scenarios)

**Coach-only.** This file holds the answer key. Upload it to the FDE Client Sparring Partner project.
Do not open it before a drill: your own file is `resources/Architecture-Practice.md`, which has the
scenarios and the schedule without the answers.

| Q# | Scenario | A strong answer covers |
| --- | --- | --- |
| 1 | A marketing team needs a static website for global users, with HTTPS and the lowest possible cost. | S3 plus CloudFront with Origin Access Control, ACM certificate, Route 53. No servers at all. |
| 2 | A web app runs on one EC2 instance and goes down whenever the instance fails. Make it highly available. | ALB, Auto Scaling group across 2+ AZs, stateless app with sessions in ElastiCache or DynamoDB, RDS Multi-AZ. |
| 3 | A relational database must survive an AZ failure with minimal downtime. | RDS Multi-AZ for availability vs read replicas for scaling; Aurora as an option; failover time. |
| 4 | A read-heavy product catalog has database CPU at 90%. | Read replicas, ElastiCache in front of the database, CloudFront for static assets, cache invalidation. |
| 5 | Users upload images and need thumbnails generated automatically. | S3 event to Lambda (or via SQS), a separate output bucket to avoid infinite loops, failure handling. |
| 6 | Orders must never be lost during traffic spikes. | SQS to decouple, a dead-letter queue, idempotent consumers, scaling workers on queue depth. |
| 7 | EC2 in a private subnet must download updates but stay unreachable from the internet. | NAT gateway per AZ, route tables, NAT cost, a gateway endpoint for S3 traffic. |
| 8 | An app needs S3 access with no credentials on servers and no traffic over the internet. | IAM role via instance profile, S3 gateway VPC endpoint, bucket policy restricted to the endpoint. |
| 9 | Database passwords must be stored securely and rotated automatically. | Secrets Manager with automatic rotation vs Parameter Store, KMS encryption, IAM access to the secret. |
| 10 | Audit logs must be kept 7 years, are rarely read, and must be cheap and tamper-proof. | CloudTrail to S3, lifecycle to Glacier Deep Archive, S3 Object Lock, retrieval times. |
| 11 | A mobile app's API has unpredictable traffic, from zero to thousands of requests a second. | API Gateway, Lambda, DynamoDB on-demand, Cognito for auth, throttling and concurrency limits. |
| 12 | A company's data center needs a private, consistent connection to AWS. | Site-to-Site VPN (fast to set up) vs Direct Connect (consistent); Direct Connect with a VPN as backup. |
| 13 | A SaaS product must isolate each customer's data. | Silo vs pool vs bridge tenancy, per-tenant KMS keys, partition keys, IAM conditions, cost trade-offs. |
| 14 | A customer requires all their data to stay in the EU. | Region choice, SCPs that block other regions, replication and backup locations, logs and support access. |
| 15 | A webhook receiver gets bursts of 10,000 events a minute and must never process one twice. | API Gateway to SQS, deduplication with idempotency keys in DynamoDB, DLQ, FIFO vs standard queues. |
| 16 | A company wants near-real-time clickstream analytics. | Kinesis Data Streams or Firehose to S3, Athena for queries, partitioning, cost at volume. |
| 17 | A regional outage must be survivable with RTO 1 hour and RPO 15 minutes. | DR strategies (backup and restore, pilot light, warm standby, multi-site), cross-region replication, testing the failover. |
| 18 | The monthly AWS bill doubled. Find and cut the cost. | Cost Explorer and tags, rightsizing, Savings Plans, NAT and data transfer costs, idle resources, S3 storage classes. |
| 19 | A nightly 3-hour batch job can tolerate interruptions. | Spot instances or Fargate Spot, AWS Batch, checkpointing, EventBridge Scheduler. |
| 20 | A small team must pick between ECS, EKS and Fargate for a containerized app. | Fargate for low operations overhead, EKS only when Kubernetes is actually needed, cost and skills trade-offs. |
| 21 | Users in Asia complain about slow responses from an app in us-east-1. | CloudFront, Global Accelerator, Route 53 latency routing, Aurora Global Database or DynamoDB global tables. |
| 22 | A company with 20 AWS accounts needs central control and guardrails. | Organizations, SCPs, Control Tower, IAM Identity Center, a central logging account. |
| 23 | An AWS access key was leaked publicly on GitHub. | Deactivate and rotate immediately, CloudTrail investigation, GuardDuty, least privilege, prevention with roles instead of keys. |
| 24 | A regulated customer wants LLM-powered Q&A over its own documents, with no data leaving its control. | Bedrock, S3, a vector store (OpenSearch), VPC endpoints, KMS, logging, guardrails, access by user permissions. |
| 25 | An on-premises PostgreSQL database must move to AWS with minimal downtime. | DMS with change data capture, Schema Conversion Tool if the engine changes, cutover plan, rollback plan. |
| 26 | Final: design an AI hiring platform that must handle 10x growth over a year. | Multi-AZ core, async queues for AI jobs, tenancy model, observability, cost per customer, a phased plan. |
