#!/bin/bash

terraform init

terraform plan -input=false -out=my-plan

terraform apply -auto-aprove my-plan