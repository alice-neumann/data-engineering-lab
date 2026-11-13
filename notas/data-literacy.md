# Data Literacy

Baseado no curso "Compreenda Dados usando IA. O Papel da IA na Data Literacy", de Paulo Andrade (Udemy).

## Introdução

### O que é Data Literacy

1. Ler dados → interpretar números, textos e padrões em busca de sentido
2. Entender dados → conectar informações ao contexto e identificar o que elas significam
3. Criar com dados → transformar dados em análises, modelos e soluções práticas
4. Comunicar com dados → explicar conclusões de forma clara e acionável para outras pessoas

* Fluência em dados + IA = vantagem competitiva

### IA Generativa

#### Como a IA interage com Dados

- Interpretação de dados textuais → analisa textos, relatórios, avaliações e comentários
- Interpretação de dados numéricos → identifica padrões, tendências e desvios em métricas
- Visualização assistida → sugere gráficos e representações mais adequadas para a mensagem
- Automação → reduz trabalho repetitivo de organização, limpeza e organização de dados

#### Limitações e Cuidados

- Risco de alucinações → a IA pode inventar fatos ou apresentar informações sem base real
- Dependência da qualidade dos dados → resultados só são confiáveis quando os dados são bons
- Questões éticas → o uso de IA precisa considerar privacidade, viés e responsabilidade

### Por que a Fluência em Dados é essencial?

#### Benefícios para as Organizações

- Maior eficiência e produtividade → decisões ficam mais rápidas e baseadas em evidência
- Redução de erros por má interpretação de dados → menos uso de suposições sem suporte
- Cultura *data-driven* → a organização passa a agir com indicadores e dados reais
- Vantagem competitiva em mercados dinâmicos → empresas mais ágeis respondem melhor às mudanças

#### Desafios e Responsabilidades

- Evitar dependência cega de IA → não usar a tecnologia sem validar o resultado
- Garantir qualidade e ética no uso de dados → manter rigor, privacidade e transparência
- Treinamento contínuo dos colaboradores → a capacidade de interpretar dados precisa ser desenvolvida

## Conceitos Fundamentais de Dados

### Tipos de Variáveis

- Variáveis qualitativas → representam características ou categorias

  - Nominais → categorias sem ordem definida, como cor ou cidade
  - Ordinais → categorias com ordem, como nível de satisfação
  - Ex: pesquisa de opinião, classificação de produtos
- Variáveis Quantitativas → representam medidas numéricas

  - Discretas → valores contáveis, como quantidade de itens
  - Contínuas → valores que podem variar sem interrupção, como altura ou tempo
  - Ex: controle de estoque, monitoramento de saúde
- Dados Estruturados → organizados em tabelas, colunas e linhas

  - Ex: planilhas, bases de clientes
- Dados Não Estruturados → informações sem formato rígido e mais difíceis de analisar diretamente

  - Ex: e-mails, áudios, imagens, vídeos
- A relação com a IA → a IA interpreta melhor dados estruturados e também consegue processar textos e imagens

  - Ex: prever vendas futuras (dados estruturados) vs. analisar sentimentos em redes sociais (dados não estruturados)

### Estatística Descritiva

- **Média**: qual o valor típico?
  - Limitação → pode ser influenciada por valores muito altos ou muito baixos
- **Mediana**: qual o ponto central?
  - Mais estável frente a outliers
- **Moda**: qual é o mais comum?
- **Desvio Padrão**: quão consistentes são os dados?
  - Controle de qualidade

### Correlação vs. Causalidade

- O que é Correlação (mostra padrões)
  - Relação estatística entre duas variáveis
  - Indica que se movem juntas mas não significa que uma causa a outra
  - Ex: aumento de vendas de sorvete e aumento de afogamentos no verão
- O que é Causalidade (explica mecanismos)
  - Relação de causa e efeito → uma variável influencia diretamente a outra
  - Exige mais evidências do que a correlação (experimentos controlados / análises profundas)
  - Ex: aumento no consumo de calorias causa aumento de peso, se não houver compensação

### Como a IA interpreta Dados Brutos

- Dados Brutos

  - Dados coletados em seu formato original, sem tratamento
  - Ex: números em uma planilha, e-mails, imagens, áudios
  - Desafio: os dados sozinhos nao têm significado até serem processados
- Pré-processamento de Dados

  1. Limpeza → remove erros e inconsistências
  2. Normalização → padroniza escalas e formatos
  3. Estruturação → organiza os dados em formato útil para análise

  - Ex: transformar um texto em uma lista de palavras ou tokens
- Interpretação de Dados Estruturados

  - A IA lê tabelas, bancos de dados e planilhas
  - Identifica padrões, correlações e tendências
  - Ex: prever vendas futuras a partir de dados de meses anteriores
- Interpretação de Dados Não Estruturados

  - Processamento de Linguagem Natural (PLN)
  - Reconhecimento de imagem
  - Reconhecimento de fala
  - Ex: analisar comentários de clientes para identificar sentimentos positivos ou negativos
- Representações Internas (Embeddings)

  - Transformam dados em vetores numéricos
  - Permitem que a IA compare similaridade e diferenças entre informações
  - Ex: identificar que "feliz" e "contente" têm significados próximos em análises de texto
- De Dados a Insights

  - Dados brutos >> Processamento >> Insights
  - Ex: recomendação de produtos com base em compras anteriores e comportamento de usuários semelhantes

### Formatos de Arquivos

- TXT
  ```txt
  Olá, mundo!
  ```
  
- CSV
  ```csv
  nome,idade
  Bruna,28
  Bruno,35
  ```
- JSON
  ```json
  {
    "nome": "Bruna",
    "idade": 28
  }
  ```
- XML
  ```xml
  <cliente>
    <nome>Bruna</nome>
    <idade>28</idade>
  </cliente>
  ```
- XLSX
  ```text
  Planilha
  ┌─────────┬───────┐
  │ nome    │ idade │
  ├─────────┼───────┤
  │ Bruna   │ 28    │
  │ Bruno   │ 35    │
  └─────────┴───────┘
  ```
- ODS
  ```text
  Planilha
  ┌─────────┬───────┐
  │ nome    │ idade │
  ├─────────┼───────┤
  │ Bruna   │ 28    │
  │ Bruno   │ 35    │
  └─────────┴───────┘
  ```
- SQL/SQLite Dumps
  ```sql
  CREATE TABLE clientes (
    nome TEXT,
    idade INTEGER
  );

  INSERT INTO clientes (nome, idade) VALUES ('Bruna', 28);
  ```

## Como a IA Transforma Coleta e Análise de Dados

### Coleta de Dados

- Web Scraping → coleta dados públicos disponíveis em páginas web para análise
  - Ex: coletar avaliações de produtos em e-commerces, monitorar menções de marcas em redes sociais abertas
- Uso de APIs → conecta sistemas para coletar dados em tempo real ou em lotes
  - Ex: API do Twitter para análise de sentimentos em postagens, API de sistemas de ERP para integrar dados de vendas e estoque

### Limpeza e Preparação de Dados

- *Garbage in, garbage out*
- Detecção de inconsistências
- Correção automática de dados
- Tratamento de dados ausentes
- Padronização e normalização → unifica formatos e escalas para melhorar análise
- Desafios da limpeza com IA → mesmo automatizando, é preciso revisar o resultado com cuidado

### Análise Acelerada por IA

- Identificação de padrões
- Reconhecimento de tendências
- Detecção de anomalias
- Velocidade e escalabilidade
- Benefícios estratégicos → aumenta produtividade e melhora decisões com base em evidência
- Desafios e cuidados → a automação precisa ser validada e supervisionada

## Visualização e Storytelling com Dados e IA

### Princípios de Comunicação de Dados

- Elementos de uma boa narrativa com dados

  - Clareza
  - Contexto
  - Relevância
  - Sequência lógica
- Estrategias de storytelling com dados

  - Problema
  - Evidência
  - Insight →
  - Ação
- Exemplos:

  - Negócios → apresentar a evolução de vendas destacando os fatores que impulsionaram o crescimento
  - Saúde → contar a história da redução de casos de uma doença após a introdução de uma vacina
  - Educação → mostrar como políticas públicas impactaram a evasão escolar ao longo do tempo
- Recursos visuais na comunicação → gráficos e imagens ajudam a tornar a informação acessível
- Relevância estratégica → a comunicação de dados deve apoiar decisão, alinhamento e confiança

  - Tomada de decisão → orienta a escolha correta
  - Alinhamento → facilita o entendimento entre áreas
  - Confiança → aumenta credibilidade da análise

### Evitando Visualizações Ineficazes

- Problemas Comuns

  - Excesso de informações
  - Uso inadequado de cores
  - Escolha incorreta do gráfico
  - Escalas distorcidas
- Boas Práticas

  - Simplicidade
  - Cores com propósito
  - Uso do tipo de gráfico adequado
- Benefícios estratégicos → visualizações bem feitas aceleram entendimento e tomada de decisão

  - Comunicação → facilita a leitura
  - Decisão → apoia escolhas com base em evidência
  - Democratização → permite que mais pessoas entendam os dados

## Ética e Responsabilidade

### Vieses Algorítmicos

- Algortimos podem reproduzir ou amplificar preconceitos existentes nos dados
- A origem do viés pode estar em dados históricos incompletos ou mal representados
- Ex: sistema de recrutamento que favorecem determinados perfis, ferramentas de crédito que discriminam por região

### Impactos dos Vieses

- Decisões injustas ou discriminatórias → afetam pessoas e grupos de forma desigual
- Perda de confiança de clientes e sociedade
- Riscos legais e reputacionais para organizações → podem gerar processos e prejuízos de imagem

### Como Reduzir os Vieses

- Diversificar bases de dados
- Monitorar continuamento resultados
- Adotar técnicas de IA explicável → tornar decisões mais transparentes e compreensíveis
- Envolver equipes multidisciplinares → combinar visão técnica, ética e de negócio

### Proteção de Dados Pessoais

- LGPD (Brasil) e GDPR (Europa) regulam coleta, armazenamento e uso
- Empresas devem garantir consentimento informado e uso transparente

### Boas Práticas de Proteção

- Minimizar coleta
- Anonimizar dados
- Implementar segurança
- Treinar equipes
