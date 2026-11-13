# ChatGPT para Análise de Dados

Baseado no curso "Data Engineer Bootcamp - SQL, Python, Cloud, Bash, AI, Git & GitHub", capítulo "ChatGPT Tutorial", de Luke Barousse (Youtube).

## Estrutura de um bom prompt

1. Tarefa → O que precisa ser feito

   - Ex: "Crie uma query para calcular o número de clientes por estado"
2. Contexto → Quais tabelas, campos e regras de negócio existem

   - Ex: "Tabela sales.customers com campos customer_id, state e income"
3. Referência → Dados de exemplo, schema, output desejado, linguagem esperada

   - Ex: "Quero retorno com duas colunas: state e total_clientes"
4. Avaliar → Verificar se a resposta está correta, coerente e útil

   - Testar SQL, confirmar hipóteses e validar resultados
5. Iterar → Refinar a pergunta, ajustar o contexto e melhorar a resposta

   - Ex: "Agora considere apenas clientes com income > 5000"

## Modelo de prompt útil

```SQL
Atue como um analista de dados júnior -- que precisa de instruções claras e contexto bem definido, quanto mais preciso for o prompt, mais útil e correta será a resposta

Tarefa: calcular a quantidade de clientes por estado
Contexto: a tabela sales.customers possui as colunas customer_id, state, professional_status e income
Requisito: retornar apenas estado e total_clientes, ordenando por maior valor
Formato da resposta: SQL em PostgreSQL
Se houver ambiguidade, explique as premissas antes de responder
```

## Como validar respostas

- Comparar com a fonte de verdade: dados reais, SQL executado, testes e benchmarks
- Verificar lógica e consistência interna
- Confirmar regras de negócio e filtros
- Pedir explicação do raciocínio e das suposições
- Revisar se a resposta atende exatamente ao que foi pedido
- Validar em ambiente real antes de usar em uma decisão importante
- Manter revisão humana como etapa final

### Erros comuns

- SQL que parece certo, mas usa colunas ou filtros errados
- Conclusões sem confirmar a regra de negócio
- Respostas genéricas demais para o contexto
- Alucinações e afirmações sem base em dados
- Confiança excessiva em uma saída não validada
