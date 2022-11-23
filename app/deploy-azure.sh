if [ -z "$1" ]; then
    echo "ERROR: You must pass an account key as an argument"
    exit 1
fi

npm run build
az storage blob upload-batch -s dist -d '$web' --account-name capybara --overwrite --account-key $1
