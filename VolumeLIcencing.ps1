$ms_phone_number = "(0) (800) 018 8354 OR (44) (203) 147 4930"

# Get the product key for VAS from AWS parameter store
$product_key = aws ssm get-parameter --name "lecp-volume-licencing-key" | ConvertFrom-json.Parameter.Value

# Get IID to give Microsoft
slmgr.vbs /ad-activation-get-IID ${product_key}

# Phone Microsoft with the IID output from above to get the CID
Write-Host "Please phone Microsoft Volume Activation Licencing on ${ms_phone_number} and supply the output string above"

# Get the CID from the user
$CID = Read-Host -Prompt "Enter the Confirmation ID from Microsoft"

slmgr.vbs /ad-activation-apply-cid ${product_key} ${CID}

