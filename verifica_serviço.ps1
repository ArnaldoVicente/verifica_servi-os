# 1. Definir o nome do serviço que deseja verificar e iniciar (digitando o mesmo).
$nomeDoServico = Read-Host "Digite o nome do serviço que deseja verificar e iniciar"

# 2. Utilizar o cmdlet Get-Service para obter o status do serviço especificado.
$service = Get-Service -Name $nomeDoServico -ErrorAction SilentlyContinue

if ($service -eq $null) {
    Write-Host "O serviço $nomeDoServico não foi encontrado."
} else {
    # 3. Verificar se o status do serviço é diferente de "Running" (em execução). Se estiver parado, iniciamos o serviço utilizando o cmdlet Start-Service.
    if ($service.Status -ne "Running") {
        Start-Service -Name $nomeDoServico

        # 4. Exibir uma mensagem indicando se o serviço foi iniciado com sucesso ou se já está em execução.
        Write-Host "O serviço $nomeDoServico foi iniciado com sucesso."
    } else {
        Write-Host "O serviço $nomeDoServico já está em execução."
    }
}
