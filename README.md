# PowerShell-WriteToCMTrace
PowerShell script that allows you to create log files that you can view in CMTrace

## Usage

If you want to include this inside of a script simply just include the file in your script

```powershell
Import-Module CMTradeLog.psm1
```

Then when you wish to log something just access the cmdlet

```powershell
If (Test-Path $Path)
{
  Write-CMTrace -Message "Path exists" -Component "my_function"
} else {
  Write-CMTrace -Message "Path does not exist" -Component "my_function"
}
```

There are 3 different log levels:
1. Log level 1 is informational and the default log level.
2. Log level 2 is warning.
3. Log level 3 is error.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Frankrd3/PowerShell-WriteToCMTrace.
