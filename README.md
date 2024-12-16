# Slash

A Powershell module that converts Windows-style paths to Unix-style paths

&nbsp;
To install a PowerShell module from a .psm1 file, you have several options:

## Manual Installation

1. Locate the appropriate module directory:
   - For current user: `$HOME\Documents\WindowsPowerShell\Modules`
   - For all users: `$env:ProgramFiles\WindowsPowerShell\Modules`

2. Create a new folder with the same name as your module in the chosen directory.

3. Copy the .psm1 file into the newly created folder.

4. Import the module using:
   ```powershell
   Import-Module ModuleName
   ```

## Using PsGet

The PsGet module offers an alternative method:

1. Import PsGet:
   ```powershell
   Import-Module PsGet -Prefix GH
   ```

2. Install the module using the -ModulePath parameter:
   ```powershell
   Install-GHModule -ModulePath "C:\Path\To\YourModule.psm1"
   ```

## Automatic Import

To avoid manually importing the module in new sessions:

1. Add the Import-Module command to your PowerShell profile:
   ```powershell
   Add-Content $PROFILE "`nImport-Module ModuleName"
   ```

2. Alternatively, place the module in a directory listed in $env:PSModulePath for automatic loading.

## Verification

After installation, verify the module is available:

```powershell
Get-Module -ListAvailable ModuleName
```

Remember to replace "ModuleName" with your actual module name in these commands[1][3][4][5].

Citations:
[1] https://superuser.com/questions/1581196/how-can-i-run-psd1-and-psm1-files-in-powershell
[2] https://www.techthoughts.info/powershell-modules/
[3] https://www.comparitech.com/net-admin/install-powershell-modules/
[4] https://stackoverflow.com/questions/55404016/how-do-i-install-a-module-using-a-psm1-file
[5] https://learn.microsoft.com/de-de/powershell/scripting/developer/module/installing-a-powershell-module?view=powershell-7.4
[6] https://valoremreply.com/resources/insights/blog/2020/january/creating-a-powershell-module/
[7] https://activedirectorypro.com/install-powershell-modules/

## oversimplified windows Installation

1. Create a folder named `slash` in your PowerShell module path (usually `%WINDIR%/system32/WindowsPowerShell/v1.0/Modules`).
2. Copy `slash.psm1` to the folder you created in step 1.
3. Restart PowerShell.

&nbsp;

## Usage

```powershell
slash -path {wanted_path} -with_drive {$true|$false}
```

&nbsp;

## Examples

- ```powershell
  slash -path "C:\Windows\System32\WindowsPowerShell" -with_drive $true
  ```

    **-> Output:** &nbsp; `C:/Windows/System32/WindowsPowerShell`

- ```powershell
  slash -path "C:\Windows\System32\WindowsPowerShell" -with_drive $false
  ```

    **-> Output:** &nbsp; `/Windows/System32/WindowsPowerShell`

- ```powershell
  slash C:\Windows\System32\WindowsPowerShell 0
  ```

    **-> Output:** &nbsp; `C:/Windows/System32/WindowsPowerShell`

- ```powershell
  slash C:\Windows\System32\WindowsPowerShell
  ```

    **-> Output:** &nbsp; `/Windows/System32/WindowsPowerShell`
