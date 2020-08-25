#Query to list all Azure subscriptions via Partner Center Powershell, list the subscription Id, subscription name and to show the creation date.

Connect-PartnerCenter -UseDeviceAuthentication

$customers = Get-PartnerCustomer 

for ($i=0 ; $i -lt $customers.length; $i ++) {
$subscription = Get-PartnerCustomerSubscription -CustomerId $customers[$i].CustomerId 

for ($j=0 ; $j -lt $subscription.length; $j ++) {
    

    if ($subscription[$j].UnitType -eq "Usage-based")

    {
     Write-Verbose -Message "Changing to Subscription ID: $($subscription[$j].SubscriptionId), Subscription Name: $($subscription[$j].FriendlyName) belongs to $($customers[$i].Name) , Creation Date: $($subscription[$j].CreationDate)"  -Verbose 

    }
}
}
