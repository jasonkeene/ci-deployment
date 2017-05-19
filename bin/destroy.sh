#!/bin/bash

terraform destroy \
    -var "do_token=${DO_PAT}" \
    -var "pub_key=${PUB_KEY}" \
    -var "pvt_key=${PVT_KEY}" \
    -var "ssh_fingerprint=${SSH_FINGERPRINT}"
