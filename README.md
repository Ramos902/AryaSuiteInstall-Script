# AryaSuite Install Automation
 
Script PowerShell de automação para instalação e inicialização da suíte Arya (Pixeon), desenvolvido para uso interno no **Hospital Dr. Léo Orsi Bernardes**.
 
## Sobre
 
O processo de configurar o sistema Arya Suite em novas estações exigia que o técnico executasse manualmente o download do instalador, aguardasse a conclusão, iniciasse os processos na ordem correta e limpasse os arquivos temporários — em cada máquina individualmente.
 
O script automatiza todo esse fluxo e foi distribuído via **GPO**, eliminando a intervenção manual em cada estação.
 
## O que o script faz
 
1. Baixa o instalador diretamente do servidor interno
2. Executa a instalação silenciosa e aguarda a conclusão
3. Inicia o `arya.exe` via protocolo customizado
4. Monitora até confirmar que o processo está ativo
5. Inicia o `suite.exe`
6. Remove os arquivos temporários
## Tecnologias
 
- **PowerShell** — automação principal
- **Batch Script** — execução com permissões adequadas
- **VBScript** — execução silenciosa sem janela de terminal
 
