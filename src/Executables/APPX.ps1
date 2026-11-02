# Removes AppX packages for all users and deprovisions them so feature updates don't bring them back.
# Packages Windows marks as NonRemovable are skipped on purpose (forcing them out is what breaks things).
# https://learn.microsoft.com/en-us/windows/application-management/remove-provisioned-apps-during-update
param([Parameter(Mandatory)][string[]]$Name)

$deprovisioned = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned'
$provisioned = Get-AppxProvisionedPackage -Online

foreach ($n in $Name) {
    $provisioned | Where-Object DisplayName -eq $n | ForEach-Object {
        Remove-AppxProvisionedPackage -Online -PackageName $_.PackageName -AllUsers -ErrorAction Continue | Out-Null
    }
    # -AllUsers removal must target the bundle when the app was installed from one
    # https://learn.microsoft.com/en-us/powershell/module/appx/remove-appxpackage
    $packages = @(Get-AppxPackage -AllUsers -PackageTypeFilter Bundle -Name $n)
    if (-not $packages) { $packages = @(Get-AppxPackage -AllUsers -Name $n) }
    foreach ($p in $packages | Where-Object { -not $_.NonRemovable }) {
        try {
            Write-Host "Removing $($p.PackageFullName)"
            Remove-AppxPackage -Package $p.PackageFullName -AllUsers -ErrorAction Stop
            New-Item -Path $deprovisioned -Name $p.PackageFamilyName -Force | Out-Null
        } catch {
            Write-Warning "Could not remove $($p.PackageFullName): $_"
        }
    }
}
