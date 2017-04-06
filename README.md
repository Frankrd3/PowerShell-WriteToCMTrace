# PowerShell-WriteToCMTrace
PowerShell script that allows you to create log files that you can view in CMTrace

## Usage

If you want to include this inside of a script simply just include the file in your script

```powershell
. .\writeto-cmtrace.ps1
```

Then when you wish to log something just access the cmdlet

```powershell
If (Test-Path $Path)
{
  Write-ToLog -Message "Path exists" -Component "my_function"
} else {
  Write-ToLog -Message "Path does not exist" -Component "my_function"
}
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Frankrd3/PowerShell-WriteToCMTrace.
