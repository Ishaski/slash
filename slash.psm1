function Convert-PathSlash {
    <#
    .SYNOPSIS
    Converts file paths between Windows and WSL formats.

    .DESCRIPTION
    This function takes a file path and converts backslashes to forward slashes,
    optionally removing or including the drive letter.

    .PARAMETER Path
    The file path to convert.

    .PARAMETER IncludeDrive
    If specified, includes the drive letter in the converted path.

    .EXAMPLE
    Convert-PathSlash -Path "C:\Windows\System32"
    Returns: "/Windows/System32"

    .EXAMPLE
    Convert-PathSlash -Path "C:\Users\Username\Documents" -IncludeDrive
    Returns: "C:/Users/Username/Documents"
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        # [Alias("FilePath")]
        [string]$Path,
        
        [Parameter(Mandatory = $false)]
        [Alias("with_drive")]
        [switch]$IncludeDrive = $false
    )
	
	

    process {
        $convertedPath = $Path -replace '\\', '/'
        
        if (-not $IncludeDrive) {
            $convertedPath = $convertedPath -replace '^[A-Za-z]:', ''
        }
        
        return $convertedPath
    }
}


# Export-ModuleMember -Function Convert-PathSlash
	
	# Function Slash([string]$path, [boolean]$with_drive = $false) {
    # if ($with_drive -eq $false) {
        # Write-Host $path.replace("\", "/").replace($path.split("\")[0], "")
    # }
    # else {
        # Write-Host $path.replace("\", "/") 
    # }
# }

# Export-ModuleMember -Function "Slash"
# Create an alias named 'Slash' for the Convert-PathSlash function
New-Alias -Name Slash -Value Convert-PathSlash

# Export both the function and the alias
Export-ModuleMember -Function Convert-PathSlash -Alias Slash
