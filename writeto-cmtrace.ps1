<#
MIT License

Copyright (c) 2017 Frank

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.


.SYNOPSIS
    Writes desired text to log file that cmtrace/smstrace can understand.

.DESCRIPTION
    Allows you to create log files that are able to be interpreted by cmtrace or smstrace programs.

.EXAMPLE
  Write-ToLog -Message "Hello world!" -Component "my_function"

.EXAMPLE
  Write-ToLog -Message "Hello world!" -Component "my_function" -LogLevel 2

.EXAMPLE
  Write-ToLog -Message "Hello world!" -Component "my_function" -LogLevel 3 -ErrFile "my_file.ps1"

.EXAMPLE
  Write-ToLog -Message "Hello world!" -Component "my_function" -LogLevel 2 -ErrFile "my_file.ps1" -LogFile "my_log.log"


#>

Function Write-ToLog {
    [CmdletBinding()]
    Param(
      [Parameter(Mandatory=$true,HelpMessage="Message to send to the log file. ")]
      [String]$Message,
      [Parameter(Mandatory=$false,HelpMessage="Set the log level")]
      [Int32]$LogLevel = 1,
      [Parameter(Mandatory=$false,HelpMessage="Log File Location")]
      [String]$LogFile = 'output.log',
      [Parameter(Mandatory=$false,HelpMessage="The file that has caused the error.")]
      [String]$ErrFile,
      [Parameter(Mandatory=$true,HelpMessage="Component of the script that is being logged")]
      [String]$Component
    )

    # Check to see if the path for the log file currently exists, if not then create it.
    If ((Test-Path $LogFile) -eq $false)
    {
      # Create the new file and output cmdlet to null
      New-Item -Type File -Path $LogFile | Out-Null
    }

    # Add the content to the log file.
    Add-Content -Path $LogFile -Value "<![LOG[$Message]LOG]!><time=`"$(Get-Date -Format HH:mm:ss.fff)+000`" date=`"$(Get-Date -Format M-d-yyyy)`" component=`"$Component`" context=`"$env:USERDOMAIN\$env:USERNAME`" type=`"$LogLevel`"  thread=`"$([Threading.Thread]::CurrentThread.ManagedThreadId)`" file=`"$ErrFile`">"
}
