# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: MIT-0
#!/bin/bash
aws s3 cp s3://{s3-dlake}/scripts/create-{genre}.sql .
presto-cli --catalog hive -f create-{genre}.sql --output-format TSV > {genre}-films.tsv
aws s3 cp {genre}-films.tsv s3://{s3-dlake}/movielens/{genre}/