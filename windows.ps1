# Spacesuit
# Turn your computer into an awesome software development machine!


function Get-InstalledPackages {
	[CmdletBinding()]
	[OutputType([array])]
	param()
	process {
		$output = clist -lr
		$results = $output.Split("[`r`n]")
		$packages = New-Object System.Collections.ArrayList
		ForEach ($result in $results) {
			$packages.Add($result.Split("|")[0]) | Out-Null
		}
		$packages

	}
}

function Test-Installed {
	[CmdletBinding()]
	[OutputType([bool])]
	param(
		[Parameter(Mandatory=$true,
			   ValueFromPipelineByPropertyName=$true,
			   Position=0)]
		[string]
		$Package
	)
	process {
		$result = Get-InstalledPackages
		$result -contains $Package
	}
}

function Test-Upgradable {
	[CmdletBinding()]
	[OutputType([bool])]
	param(
		[Parameter(Mandatory=$true,
			   ValueFromPipelineByPropertyName=$true,
			   Position=0)]
		[string]
		$Package
	)
	process {
		$output = cup $Package -whatif -r
		$upgradable = $output.Split("|")[-1]
		[System.Convert]::ToBoolean($upgradable)
	}
}

function Sync-Package {
	[CmdletBinding()]
	param(
		[Parameter(Mandatory=$true,
			   ValueFromPipelineByPropertyName=$true,
			   Position=0)]
		[string]
		$Package
	)
	process {
		if (Test-Installed $Package) {
			if (Test-Upgradable $Package) {
				Write-Host "Upgrading" $Package "..."
				cup $Package -y
			} else {
				Write-Host "Already using the latest version of $Package. Skipping ..."
			}
		} else {
			Write-Host "Installing $package ..."
			cinst $Package -y
		}
	}
}

function Install-Chocolatey {
	[CmdletBinding()]
	param()
	process {
		if ((Get-Command "choco.exe" -ErrorAction SilentlyContinue) -eq $null) {
			Write-Host "Installing Chocolatey"
			iex ((New-Object Net.WebClient).DownloadString("http://chocolatey.org/install.ps1"))
		} else {
			Write-Host "Chocolatey already installed. Skipping ..."
		}
	}
}

Install-Chocolatey
Sync-Package "sudo"
Sync-Package "slack"
Sync-Package "sublimetext3"
