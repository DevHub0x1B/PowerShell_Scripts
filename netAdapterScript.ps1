
#Set-ExecutionPolicy RemoteSigned

$looping = $true

do{


Write-Host ('')

$adapterList = Get-NetAdapter -Name '*'

for($i=0; $i -lt $adapterList.Length; $i++)
{
    write-host ([System.String]::Concat($i+1, ". ", $adapterList[$i].Name, ' -------> ',  $adapterList[$i].Status, ' -------> ',  $adapterList[$i].Speed) )
}

Write-Host ('')


$selection = Read-Host('Select a number to restart a network adapter, or press q/Q to quit.')

if($selection -notmatch "([Qq0-9])"){
    Write-Host ('')
    Write-Host ('**Bad input - Please select a number or press q/Q to quit, try again.**')

}elseif($selection -eq 'q' -or $selection -eq 'Q'){
    Exit

}elseif($selection -in 1..$adapterList.Count){
    $netObject = $adapterList[$selection-1]
    Write-Host ('Restarting network adapter ' + $netObject.ifAlias)    
    
    Write-hOST "Working..."
    Restart-NetAdapter -Name $netObject.ifAlias    
    
    Start-Sleep -s 5
}


}While($looping)




