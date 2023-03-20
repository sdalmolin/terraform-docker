# terraform-docker básico (Ubuntu+Nginx)

-Usar o Terraform para configurar e implantar contêineres do Docker. Usaremos o Docker para Windows afim de  mostrar como implantar um contêiner para testes/estudo.

-Configurar terraform windows (https://build5nines.com/install-terraform-on-windows-for-use-in-command-prompt-and-powershell/)

-Configurar o subsistema do Windows para Linux (https://learn.microsoft.com/en-gb/windows/wsl/install-manual#step-4---download-the-linux-kernel-update-package)

-Configurar o Docker para área de trabalho do Windows, utilizar mecanismo baseado em WSL 2'. (https://docs.docker.com/get-docker/)

-Docker instalado, para fins de teste/estudo, precisaremos expor o daemon sem o TLS. Vá para as configurações do Docker Desktop para Windows e certifique-se de que 'Expose daemon on TCP:localhost:2375 without TLS' esteja marcado. Aplique as configurações e o Docker solicitara restart.

-Implantar contêineres do Docker usando o Terraform (Estaremos usando o provedor Docker conforme encontrado no registro do Terraform)
 * Para configurar, utilize o arquivo main.tf).
 * Execute terraform init no diretório que contém o arquivo de configuração
 * terraform plan
 * terraform aply

-De volta à GUI do Docker Desktop Windows você pode ver o contêiner em execução:
