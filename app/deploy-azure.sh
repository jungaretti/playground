#!/bin/bash

set -e

if [ -z "$ACCOUNT_KEY" ]; then
    echo "ERROR: You must export an ACCOUNT_KEY env variable"
    exit 1
fi

npm run build
az storage blob upload-batch -s dist -d '$web' --account-name capybara --overwrite --account-key $ACCOUNT_KEY
