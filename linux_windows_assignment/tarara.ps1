$text = Get-Content .\tarara.txt

echo "El texto es el siguiente:`n"
Get-Content .\tarara.txt

$palabra = Read-Host -Prompt 'Cual es la palabra que desea buscar?'
$recuento = (Select-String -InputObject $text -Pattern "$palabra" -AllMatches -CaseSensitive).Matches.Count

echo "`nLa palabra $palabra se encuentra $recuento veces`n"

$cambio = Read-Host -Prompt 'Con cual palarbra desea reemplazarlo?'

((Get-Content -path ".\tarara.txt" -Raw) -creplace "$palabra", "$cambio") | Set-Content -Path ".\tarara.txt"

echo "Las últimas 4 líneas del texto son:`n"
Get-Content .\tarara.txt -tail 4