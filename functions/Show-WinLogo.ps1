#####################
# Show Windows Logo #
Function Show-WinLogo {

    <#
	
        .SYNOPSIS
            Displays the Windows logo in ASCII art.
        .DESCRIPTION
            This function displays the Windows logo in ASCII art format.
        .PARAMETER None
            No parameters are required for this function.
        .EXAMPLE
            Show-WinLogo
            Prints the Windows logo in ASCII art format to the console.
			
    #>

	Write-Host ""
    $asciiArt = @"
██╗    ██╗██╗███╗   ██╗██████╗  ██████╗ ██╗    ██╗███████╗
██║    ██║██║████╗  ██║██╔══██╗██╔═══██╗██║    ██║██╔════╝
██║ █╗ ██║██║██╔██╗ ██║██║  ██║██║   ██║██║ █╗ ██║███████╗
██║███╗██║██║██║╚██╗██║██║  ██║██║   ██║██║███╗██║╚════██║
╚███╔███╔╝██║██║ ╚████║██████╔╝╚██████╔╝╚███╔███╔╝███████║
 ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝╚═════╝  ╚═════╝  ╚══╝╚══╝ ╚══════╝                                                                                                       
"@

    Write-Host $asciiArt -ForegroundColor Blue
	Write-Host ""
	
}