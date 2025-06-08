# PGM1683 - Trabalho Heurísticas
Disciplina: PGM1683 - Meta-heurísticas e Técnicas de Otimização Aplicadas

Curso: Programa de Pós-Graduação em Computação Aplicada - Mestrado Profissional

Membros: João Paulo Martins Rodrigues (jpmrodrigues@ucs.br), Tiago Maciel da Silva (tmsilva@ucs.br), Pedro Miguel Agostini Carraro (pmacarraro@ucs.br)

# Descrição do Trabalho
- Reúnam-se em grupos e desenvolvam um programa de computador que implemente a rotina de busca local iterativa (linguagem Matlab, Python ou C);
- No procedimento de busca local, deve ser empregada uma função para geração da solução inicial por meio do emprego de uma heurística construtiva, e outra função para gerar os vizinhos por meio do emprego de uma heurística de melhoramento;
- Empregue o programa para solução dos seguintes problemas:
  - Problema do Caixeiro Viajante (TSP);
  - Problema da Mochila (KP).
- Inicialmente, avalie a sua implementação pelo emprego das instâncias vistas em aula para cada um dos problemas. Compare os resultados obtidos com aqueles apresentados em aula.
- Em seguida, avalie a sua implementação considerando as instâncias fornecidas nos links abaixo, para cada um dos problemas:
  - TSP: capitais brasileiras brasil27.txt Download brasil27.txte TSPLIB http://comopt.ifi.uni-heidelberg.de/software/TSPLIB95/Links to an external site. ( n >= 150 );
  - KP: alpinista Dados_KP.pdf Download Dados_KP.pdfe http://artemisa.unicauca.edu.co/~johnyortega/instances_01_KP/Links to an external site. ( n > 1000 ).
- O desenvolvimento e avaliação dos algoritmos deve seguir as seguintes regras:
  - Para o TSP, a heurística construtiva empregada pode ser a mesma utilizada por um outro grupo. A heurística de melhoramento (ou refinamento) deve ser exclusiva de cada grupo;
  - Para o KP, as heurísticas construtiva e de melhoramento (ou refinamento) empregadas podem ser as mesmas utilizadas por um outro grupo;
  - Para ambos os problemas, deverá ser apresentado o melhor valor da FO encontrado, o valor médio, a mediana e o desvio padrão obtidos de um conjunto de 50 execuções do algoritmo desenvolvido, assumindo como critério de parada a quantidade de 500 e 2000 vizinhos gerados sem melhora da melhor solução. Deverá também ser apresentado o melhor resultado (solução e respectivo valor da função objetivo) obtido para cada um dos critérios de parada assumidos;
  - Apresente uma análise dos resultados obtidos e a sua conclusão.

# Definições do Trabalho
## Busca Local
- heurística construtiva: Vizinho mais Próximo
- heurística de melhoramento:
## TSP
- heurística construtiva:
- heurística de melhoramento:
## KP
- heurística construtiva:
- heurística de melhoramento: