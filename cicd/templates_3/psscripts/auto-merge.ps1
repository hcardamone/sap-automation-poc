#Set TLS 1.2 Protocol
$TLS12Protocol = [System.Net.SecurityProtocolType] 'Ssl3 , Tls12'
[System.Net.ServicePointManager]::SecurityProtocol = $TLS12Protocol

# construct base URLs
$proxy = ""
$env:SYSTEM_TEAMFOUNDATIONCOLLECTIONURI = 'https://dev.azure.com/PocRepo'
$env:SYSTEM_TEAMPROJECT = 'POC%20Repo'
$apisUrl = "$($env:SYSTEM_TEAMFOUNDATIONCOLLECTIONURI)/$($env:SYSTEM_TEAMPROJECT)/_apis"
$projectUrl = "$apisUrl/git/repositories/POC_REPO_MAIN_ECC"

# create common headers
$AZ_USR_PR = ''
$AZ_PWD_PR = ''
$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $AZ_USR_PR,$AZ_PWD_PR)))
$headers = @{}
$headers.Add("Authorization", "Basic {0}" -f $base64AuthInfo)
$headers.Add("Content-Type", "application/json")

# Create a Pull Request
$pullRequestUrl = "$projectUrl/pullrequests?api-version=5.1"
$pullRequest = @{
        "sourceRefName" = "refs/heads/temp"
        "targetRefName" = "refs/heads/main"
        "title" = "Create Automatic Merge Request by POWERSHELL"
        "description" = "CREATE AUTOMATIC MERGE REQUEST TEMP INTO MAIN"
    }

$pullRequestJson = ($pullRequest | ConvertTo-Json -Depth 5)

Write-Host "Sending a REST call to create a new pull request from temp to main" -ForegroundColor Green


# REST call to create a Pull Request
$pullRequestResult = Invoke-RestMethod -Method POST -Headers $headers -Body $pullRequestJson -Uri $pullRequestUrl -Proxy $proxy
$pullRequestId = $pullRequestResult.pullRequestId
$StatusActive = $pullRequestResult.status

if ( $StatusActive -eq 'active' )
{
	Write-Output "Pull request created. Pull Request Id: $pullRequestId"
}
else{

    $_.Exception.Message

}

# Set PR to auto-complete
$setAutoComplete = @{
    "autoCompleteSetBy" = @{
        "id" = $pullRequestResult.createdBy.id
    }
    "completionOptions" = @{       
        "deleteSourceBranch" = $False
        "bypassPolicy" = $False
    }
}

$setAutoCompleteJson = ($setAutoComplete | ConvertTo-Json -Depth 5)

Write-Host "Sending a REST call to set auto-complete on the newly created pull request" -ForegroundColor Green

# REST call to set auto-complete on Pull Request
$pullRequestUpdateUrl = ($projectUrl + '/pullRequests/' + $pullRequestId + '?api-version=5.1')

$setAutoCompleteResult = Invoke-RestMethod -Method PATCH -Headers $headers -Body $setAutoCompleteJson -Uri $pullRequestUpdateUrl -Proxy $proxy
$mergeStatus = $setAutoCompleteResult.mergeStatus

if ( $mergeStatus -eq 'succeeded' )
{
	Write-Output "Pull request set to auto-complete"
}
else{

    $_.Exception.Message

}