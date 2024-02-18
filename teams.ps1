$p=$args.Length
$teams=Join-Path $PSScriptRoot "teams.dat"
$hallgato=Join-Path $PSScriptRoot "hallgato.dat"
if ($p -eq 0) {
    Write-Host "-lista oktatonev"
    Write-Host "-hallgato hallgatonev"
    Write-Host "-sok"
    exit 1
}

$p1=$args[0]
switch ($p1) {
    "-lista" {
        if ($p -ne 3) {
            Write-Host "-lista oktatonev"
            exit 1
        }

        Get-Content $teams | Select-String -Pattern (" " + $args[1] + " " + $args[2]) | ForEach-Object {$_.Line.Split(',')[0].Trim()}
        exit 0
    }
    "-hallgato" {
        if ($p -ne 3) {
            Write-Host "-hallgato hallgatonev"
            exit 1
        }

        $codes=(Get-Content $hallgato | Select-String -Pattern ($args[1] + " " + $args[2] + ",")) -split '\s+' | Select-Object -Skip 2 -OutVariable codes
        Get-Content $teams | Select-String -Pattern $codes | ForEach-Object {$_.Line.Split(',')[-1].Trim()}
        exit 0
    }
    "-sok" {
        if ($p -ne 1) {
            Write-Host "-sok"
            exit 1
        }

        Get-Content $teams | ForEach-Object {$_.Split(',')[-1].Trim()} | Group-Object | Sort-Object Count -Descending | Select-Object -First 1 -ExpandProperty Name
        exit 0
    }
}
#szerintem sokkal jobb lett mint az elozo