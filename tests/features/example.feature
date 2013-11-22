# language: pt
Funcionalidade: Busca Intelbras
  Como um visitante anônimo do Portal Intelbras
  Eu quero encontrar informações facilmente
  Para me beneficiar dos documentos armazenados.

  Esquema do Cenario: Quantidades adequadas de resultados
    Dado que eu estou na página inicial do Portal Intelbras
    Quando eu busco por <Termo>
    Então eu deveria ver <Número de Resultados> resultados
    Exemplos:
      | Termo        | Número de Resultados |
      | 'Telefone'   | 55                   |
      | 'Intelbras'  | 128                  |
      | 'Kurt Godel' | 0                    |

