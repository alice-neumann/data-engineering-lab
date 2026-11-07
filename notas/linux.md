# Linux e Terminal
- Notas de estudo sobre Linux (Bash/Debian): comandos, permissões, processos, serviços e automação.  
- Baseado no curso "Linux: Da migração à administração do sistema operacional", de Gabriel da Silveira Costa (Udemy).  
- Ambiente: Debian 13 (Trixie) em máquina virtual (Hyper-V).

### Acesso Administrador

- `$` → usuário comum | `#` → root (admin)
- `su` → troca para root, mantém o diretório atual
- `su - root/alice` → mudar usuário (e diretório)
- `sudo comando` → executa um comando como administrador

### Instalação de Programas 

- `apt` → uso do dia a dia (instalar, remover, buscar)
- `apt-get` → instalar, remover, atualizar; clássico, comum em scripts
- `apt-cache` → só consulta (buscar, ver detalhes), não altera o sistema
- `aptitude` → interface em texto, bom para resolver conflitos de dependência
- `apt search pacote` → procura um pacote
- `apt show pacote` → mostra detalhes do pacote
- `sudo apt update` → atualiza a lista de pacotes
- `sudo apt upgrade` → instala atualizações disponíveis
- `sudo apt install pacote` / `sudo apt remove pacote` → instala / remove um pacote

### Buscando Ajuda

- `--help` → resumo das opções do comando
- `man comando` → abre o manual (`q` para sair)
- `apropos palavra` ou `man -k palavra` → procura manuais pela descrição
- `man man` → manual do `man`

### Hierarquia de Diretórios

| Pasta | O que guarda |
|---|---|
| `/` | raiz de tudo |
| `/home` | pastas pessoais dos usuários |
| `/root` | pasta pessoal do root |
| `/etc` | arquivos de configuração |
| `/bin`, `/sbin` | programas essenciais (usuário / administração) |
| `/usr` | programas e bibliotecas instalados |
| `/var` | dados que mudam: logs, filas |
| `/tmp` | arquivos temporários |
| `/dev` | dispositivos (discos, USB) |
| `/proc`, `/sys` | informações do kernel e do hardware (virtuais) |
| `/mnt`, `/media` | discos montados |
| `/boot` | arquivos de inicialização |

### Primeiros Comandos

- `ls` / `dir` → lista arquivos e diretórios
- `pwd` → printa o caminho do diretório atual
- `echo texto` → print
- `echo "$OLDPWD"` → printa o diretório anterior
- `cd ..` → volta um diretório
- `cd -` → volta ao diretório anterior
- `cd` / `cd ~` → vai para home
- `cd ~user` → vai para a home de um usuario
- `cd /caminho` → vai para um caminho absoluto
- `cd pasta` → vai para uma pasta dentro do diretório atual


#### Opções de `ls` e comandos relacionados

- `ls -a` → inclui arquivos ocultos 
- `ls -l` → lista detalhes, como permissões, tamanho e dono
- `ls -ld pasta` → mostra detalhes da pasta, não do conteúdo
- `ls -s` → mostra o espaço ocupado em blocos
- `ls -Z` → mostra o contexto SELinux, se disponível
- `lsblk` → lista discos e partições
- `lscpu` → mostra informações da CPU
- `lspci` / `lspci -v` / `lspci -vv` → lista dispositivos PCI com mais detalhes
- `lspci -k` → mostra os drivers usados pelos dispositivos PCI
- `lsusb` → lista dispositivos USB
- `lsmod` → lista módulos do kernel carregados
- `lsb_release -a` → mostra a distribuição e sua versão
- `cat /etc/os-release` → alternativa para ver a distribuição e versão

### Identificando Arquivos

- `file arquivo` → identifica o tipo do arquivo
- `strings arquivo` → mostra textos legíveis encontrados dentro do arquivo

### Permissões de Arquivos

| Símbolo | Número | Significado |
|---|---|---|
| `---` | 0 | nenhuma |
| `--x` | 1 | exec |
| `-w-` | 2 | write |
| `-wx` | 3 | write + exec |
| `r--` | 4 | read |
| `r-x` | 5 | read + exec |
| `rw-` | 6 | read + write |
| `rwx` | 7 | tudo |

- `drwxr-xr-x` → `d` = diretório
- `ls -l` → consulta permissões | `stat arquivo` → mostra permissões e outros dados
- `chmod o-x arquivo` |  `chmod o+x arquivo` → remove / adiciona execução para outros
- `chmod -x arquivo` → remove execução de todos

#### Forma Numérica

| Modo | Dono | Grupo | Outros | Uso |
|---|---|---|---|---|
| `644` | `rw-` | `r--` | `r--` | arquivos comuns |
| `755` | `rwx` | `r-x` | `r-x` | pastas e scripts públicos |
| `775` | `rwx` | `rwx` | `r-x` | pastas compartilhadas |
| `777` | `rwx` | `rwx` | `rwx` | nunca usar |

#### Dígito Especial

- SUID (4) → executa como o dono  
Ex: O comando `passwd` vira `root` por alguns segundos para salvar sua nova senha
- SGID (2) → executável usa o grupo  
Ex: Em uma pasta compartilhada com `chmod g+s projeto/`, todo arquivo criado dentro dela fica com o grupo da pasta (e não com o grupo do usuário que criou)
- Sticky Bit (1) → em pasta compartilhada, protege arquivos contra exclusão por outros  
Ex: `/tmp` todos podem criar arquivos nela, mas só o dono/root consegue apagar os seus

### Caracteres Especiais e Histórico

- `history` → histórico de comandos já usados
- `!!` → executa o último comando
- `!ls` → repete o último comando que começou com `ls`
- `!100`  → repete o comando número 100 do histórico
- `!` Ctrl + R → busca comandos anteriores
  

### Comandos em Conjunto

- `pwd ; ls` → executa `ls` **depois de `pwd`, mesmo se falhar**
- `pwd && ls` → executa `ls` **somente se `pwd` der certo**
- `pwd || ls` → executa `ls` **somente se `pwd` falhar**
- `comando &` → executa em segundo plano
- `jobs` → lista tarefas em segundo plano nesse terminal
- `fg %1` → **traz** a tarefa 1 para primeiro plano
- `bg %1` → **retoma** a tarefa 1 em segundo plano
- `kill %1` → **encerra** a tarefa
- `grep var` → tipo um ctrl F do Windows: retorna apenas o que tiver “var”
- `grep texto arquivo` → mostra linhas que contêm o texto

### Teclas de Atalho

- `Ctrl + C` → interrompe o comando em primeiro plano
- `Ctrl + E` → move o cursor para o fim da linha
- `Ctrl + Z` → pausa o comando (`bg` retoma, `fg` traz para primeiro plano)
- `Ctrl + L` → limpa a tela, como `clear`
- `Ctrl + P` / seta para cima → mostra o comando anterior
- `Ctrl + R` → busca no histórico
- `Ctrl + S` / `Ctrl + Q` → pausa / retoma saída do terminal
- `Esc` + `.` → insere o último argumento do comando anterior
- `top` → mostra processos e uso de recursos (`q` para sair)
  
### Identificando Usuários e Máquinas

- `whoami` → mostra o usuário atual
- `who am i` | `who mom likes` → mostra informações da sessão de login atual
- `who` → mostra usuários logados
- `w` → lista usuários logados e o que estão fazendo
- `loginctl list-sessions` → lista sessões do systemd
- `users` → mostra, numa linha só, os nomes dos usuários logados
- `id` → mostra UID, GID e grupos do usuário
- `hostname` → mostra o nome da máquina
- `hostnamectl` → mostra ou altera informações da máquina
- `uname` → mostra o nome do kernel
- `uname -a` → mostra detalhes do kernel e do sistema
- `uname -m` | `arch` → mostra a arquitetura 

### Criação de Diretórios

- `mkdir pasta` → cria um diretório
- `mkdir -p Alice/Monteiro/Neumann` → cria diretórios 
- `mkdir "Alice Monteiro Neumann"` → cria diretório com espaços no nome
- `mkdir Alice\ Monteiro\ Neumann` → mesmo comando
- `mkdir -m 755 pasta` → cria diretório com permissões

#### Criação de Subdiretórios
- `mkdir -p src/{sass,ts}` → cria `src/sass` e `src/ts` 
- `mkdir -p projeto/{publico/{asset/{css,js},img,pg},src/{sass,ts}}` → cria toda a estrutura do projeto de uma vez

### Gerenciamento de Arquivos e Diretórios

#### Copiar

- `cp -v arquivo.txt teste/` → copia o arquivo para `teste` (`-v` mostra a operação)
- `cp arquivo.txt outroarquivo.txt` → copia com outro nome
- `cp -rv music/ teste/` → copia a pasta e seu conteúdo (`-r` recursivo)
- `cp -i arquivo.txt outroarquivo.txt` → `-i` pergunta antes de sobrescrever

#### Mover e Renomear
- `mv -v arquivo.txt novoarquivo.txt` → renomeou
- `mv -v novoarquivo.txt teste` → moveu pra pasta teste
- `mv -v Camera Videos` → moveu a pasta **Camera** para **Videos**

#### Apagar

- `rm arquivo.txt` → apaga um arquivo
- `rmdir pasta` → apaga uma pasta vazia
- `rm -r pasta` → apaga a pasta e seu conteúdo
- `rm -i arquivo.txt` → pede confirmação antes de apagar

### Comparando e Sincronizando arquivos

- `diff arq1 arq2` → mostra diferenças entre arquivos
- `diff -r dir1 dir2` → compara diretórios e seus conteúdos
- `rsync -rv dir1 dir2` → copia a pasta `dir1` para dentro de `dir2`
- `rsync -rv dir1/ dir2` → copia só o conteúdo de `dir1` para dentro de `dir2`

### Links Físicos e Simbólicos

#### Hard link

- `ln arquivo_original.txt atalho.txt` → cria outro nome para os mesmos dados
- Normalmente não funcionam com diretórios nem entre sistemas de arquivos

#### Soft link

- `ln -s /caminho/alvo atalho` → cria um link para o alvo
- `stat atalho` → mostra dados do link 
- `stat -L atalho` → mostra dados do alvo
- Alvo movido ou apagado → link simbólico pode deixar de funcionar

### Localizando Arquivos e Sistemas de arquivos

- `-type f` → arquivos | `-type d` → diretórios
- `find . -type f -name '*.txt'` → procura arquivos `.txt` a partir da pasta atual
- `find . -type d -name 'Downloads'` → procura diretórios chamados `Downloads`
- `mount` / `findmnt` → lista sistemas de arquivos montados
- `df -h` → mostra espaço usado e livre
- `du -sh pasta` → mostra o espaço ocupado pela pasta
- `du -sh *` → mostra o espaço ocupado por cada item visível da pasta atual

### Leitura e Edição de arquivos de texto

#### Leitura

- `cat -n arquivo` → mostra o conteúdo com números de linha
- `head arquivo` | `head -n 5 arquivo` → mostra as primeiras 10 / 5 linhas
- `tail arquivo` | `tail -30 arquivo` → mostra as últimas (`-n`) 10 / 30 linhas
- `tail -f arquivo.log` → acompanha novas linhas do arquivo (`Ctrl + C` para sair)
- `tac arquivo` → mostra as linhas na ordem inversa
- `more arquivo` | `less arquivo` → lê o arquivo por páginas (`q` para sair)
- `wc arquivo` → conta linhas, palavras e bytes
- `wc -l` | `wc -w` | `wc -m` → conta linhas | palavras | caracteres

#### Filtrando Informações

- `grep 'ext4' /etc/fstab` → mostra linhas que contêm `ext4`
- `grep -v 'ext4' /etc/fstab` → mostra linhas que não contêm `ext4`
- `grep -E 'ext4|btrfs' /etc/fstab` → procura `ext4` ou `btrfs`
- `grep -i 'user' /etc/passwd` → procura sem diferenciar maiúsculas
- `grep -n --color -iE 'network|user' arquivo` → destaca resultados, mostra números das linhas e sem diferenciar maiúsculas e minúsculas

#### Editores de Texto

- `nano arquivo` → abre ou cria arquivo no Nano 
- `vim.tiny arquivo` → abre arquivo no Vim Tiny

### Usuários e Grupos
- `sudo useradd -m aluno` → cria usuário e diretório pessoal
- `sudo passwd aluno` → define ou altera a senha
- `sudo passwd -S aluno` → mostra o estado da senha
- `sudo chage -l aluno` → mostra validade e expiração da senha
- `sudo gpasswd -a aluno audio` → adiciona aluno ao grupo `audio`
- `sudo usermod -aG grupo aluno` → adiciona aluno a um grupo (`-a` mantém os outros grupos)
- `sudo addgroup grupo` → cria um grupo 
- `sudo deluser aluno` → remove o usuário 

### Gerenciamento de Processos

- `ps` → mostra processos do terminal atual
- `top` → gerenciador de tarefas
- `ps a` | `ps ax` | `ps aux` → mostra mais processos
- `pgrep -a firefox-esr` → procura processos pelo nome
- `pidof firefox-esr` → mostra os PIDs do programa
- `ps ax | grep -i firefox` → procura Firefox na lista de processos
- `kill 11387` → encerra o processo pelo PID
- `kill -l` → lista sinais
- `kill -KILL PID` → força encerramento (último recurso)
- `man signal` → manual dos sinais

#### Números Nice

- `-20` → maior prioridade | `19` → menor prioridade
- `nice -n 10 comando` → inicia comando com menor prioridade
- `sudo nice -n -1 comando` → inicia comando com maior prioridade
- `sudo renice -10 -p 6516` → aumenta a prioridade do processo 6516
- `renice +10 -p 6516` → diminui a prioridade do processo 6516

### Gerenciamento de Serviços

- systemd → gerenciador de serviços do sistema
- `systemctl` → tipo o services.msc do Windows
- `systemctl status tor` → mostra o estado do serviço
- `sudo systemctl start servico` | `sudo systemctl stop servico` → inicia / para o serviço
- `sudo systemctl enable servico` → inicia automaticamente no boot
- `sudo systemctl disable servico` → desativa início automático (não para agora)
- `sudo systemctl disable --now servico` → desativa o serviço no início automático e para agora
- `systemctl cat servico.service` → mostra a configuração do serviço
- `systemctl cat servico.socket` → mostra a configuração do socket
- `systemd-analyze` → analisa a inicialização
- `systemd-analyze blame` → mostra o tempo de inicialização por serviço
- `systemd-cgtop` → mostra uso de recursos por grupo de processos

### Compactação e Empacotamento

- `zip -r arquivo.zip pasta/` → compacta pasta em ZIP
- `unzip arquivo.zip` → extrai arquivo ZIP
- `tar -cvf arquivo.tar pasta/` → empacota sem compactar
- `tar -czvf arquivo.tar.gz pasta/` → empacota e compacta com **gzip**
- `tar -cjvf arquivo.tar.bz2 pasta/` → empacota e compacta com **bzip2**
- `tar -cJvf arquivo.tar.xz pasta/` → empacota e compacta com **xz**
- `tar -xvf arquivo.tar` → extrai arquivo TAR
- `tar -xf arquivo.tar.gz` → extrai arquivo TAR compactado
- `bzip2 -k arquivo` / `xz -k arquivo` → compacta e mantém o original
    
    | Extensão | Velocidade | Compactação | Junta várias pastas nativamente? |
    | :--- | :--- | :--- | :--- |
    | `.zip` | Rápida | Baixo / Médio | **Sim** (Cria o pacote e compacta) |
    | `.gz` | Muito Rápida | Médio | **Não** (Precisa do `tar` antes) |
    | `.bz2` | Lenta | Alto | **Não** (Precisa do `tar` antes) |
    | `.xz` | Muito Lenta | Máximo  | **Não** (Precisa do `tar` antes) |

### Shell Script

- `chmod +x script.sh` → permite execução direta
- `./script.sh` → executa o script da pasta atual

### Agendamento de Tarefas

- `crontab -e` → edita tarefas agendadas do usuário
- `crontab -l` → lista tarefas agendadas
- Formato do cron: `minuto hora dia mês dia-da-semana comando`
- `30 8 * * 1 comando` → executa toda segunda-feira às 8h30
- `at 14:30` → agenda execução única, digite o comando e finalize com `Ctrl + D`
- `systemctl list-timers` → lista temporizadores do systemd
