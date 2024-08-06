# Platform Pattern - Producer

This repository would be where a platform team publishes their modules. Application teams would act as consumers of these modules.

Modules can be assembled from individual cloud resources (`terraform/s3_bucket`), or wrap existing publications to provide an opinionated, pre-approved interface (`terraform/ec2_instance`).

This repository pairs with [platform_pattern_consumer](https://github.com/RhysDeimel/platform_pattern_consumer), to show how resources could be consumed.
