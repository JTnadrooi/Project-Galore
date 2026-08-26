$inputString = Read-Host "Enter Angel's-palette ( {{...}, {...}} )"

$pattern = '\{([^{}]*)\}'
$rMatches = [regex]::Matches($inputString, $pattern)

foreach ($match in $rMatches) {
    $inner = $match.Groups[1].Value.Trim()
    if ([string]::IsNullOrEmpty($inner)) { continue }

    $parts = $inner -split ',' | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne '' }
    if ($parts.Count -lt 3) { continue }

    try {
        $r = [int]$parts[0]
        $g = [int]$parts[1]
        $b = [int]$parts[2]

        $hexR = '{0:X2}' -f $r
        $hexG = '{0:X2}' -f $g
        $hexB = '{0:X2}' -f $b

        if ($parts.Count -ge 4) {
            $alpha = [double]$parts[3]
            $a = [int][math]::Round($alpha * 255)
            $hexA = '{0:X2}' -f $a
            Write-Output ('#' + $hexR + $hexG + $hexB + $hexA)
        }
        else {
            Write-Output ('#' + $hexR + $hexG + $hexB)
        }
    }
    catch {
        Write-Warning "Skipping invalid group: '$inner'"
    }
}