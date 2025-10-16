$validSize = $false
$matrixSize = 0

# Küsime kasutajalt maatriksi suurust ja kontrollime sisestust
while($validSize -eq $false) {
    $inputValue = Read-Host "Sisesta maatriksi suurus (3-10)"
    $conversionOk = $true

    try { # Kontrollime kas  sisestus on int
        [int]$matrixSize = $inputValue
    } catch {
        $conversionOk = $false
    }

    if($conversionOk) { # Kui kõik on korras, siis kontrollime kas kõik jääb õigesse vahemikku 
        if(($matrixSize -ge 3) -and ($matrixSize -le 10)) {
            $validSize = $true
        } else {
            Write-Host "Lubatud suurus on vahemikus 3 kuni 10."
        }
    } else {
        Write-Host "Palun sisesta number."
    }
}

# Määrame väljundfaili asukoht skripti kaustas
$outputPath = Join-Path -Path $PSScriptRoot -ChildPath "output.txt"

# Kui fail eksisteerib, eemaldame selle enne kirjutamist
if(Test-Path $outputPath) {
    Remove-Item $outputPath
}

# Genereerime maatriksi read
for($row = 0; $row -lt $matrixSize; $row++) {
    $line = ""

    # Täidame ühe rea juhuslike väärtustega
    for($col = 0; $col -lt $matrixSize; $col++) {
        $value = Get-Random -Minimum 1 -Maximum 100 # Võtame juhusliku väärtuse 1 ja 99 vahel
        $formatted = $value.ToString("00") # Faili kirjutame ainult stringe, seega teeme selle stringiks ning korrastame väljundi

        # Esimesele väärtusele ei lisata tühikut ette
        if($col -eq 0) {
            $line = $formatted
        } else {
            $line = "$line $formatted"
        }
    }

    # Lisame loodud read faili
    Out-File -FilePath $outputPath -InputObject $line -Append
}

# Teavitame kasutajat
Write-Host "Maatriks salvestati faili $outputPath"
