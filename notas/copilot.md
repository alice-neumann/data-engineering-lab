# Copilot
- Baseado no curso "Acelerando o Desenvolvimento com GitHub Copilot", de Vinicius Alexandre Silva (Udemy).

### Agentes (@)

Direcionam a pergunta para um contexto específico no chat do Copilot
- `@workspace` → pergunta sobre todo o projeto aberto
  - Ex: `@workspace /new` → cria um novo projeto a partir de uma descrição
- `@vscode` → pergunta sobre o VSCode (comandos e configurações)
- `@terminal` → pergunta sobre o terminal integrado
  
### Comandos (/)

- `@terminal /explain` → explica um comando ou erro do terminal
- `@vscode /search` → gera uma busca no VS Code
- `@workspace /newNotebook` → cria um novo notebook
  
### Variáveis de contexto (#)

Indicam o que o Copilot deve considerar na resposta
- `#editor` → conteúdo visível no editor
- `#file` → um arquivo do projeto
- `#selection` → trecho de código selecionado
- `#terminalLastCommand` → último comando executado no terminal
  - `#terminalSelection` → trecho selecionado no terminal
