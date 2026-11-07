# "Desafio" do Toy Robot

## Introdução

A grande ideia do desafio do Toy Robot é a de um robô que se move em uma mesa de 5x5 unidades.

## Descrição das regras

O robô se move conforme algumas regras básicas, que são:

1. O robô só se move uma casa, na diração que está olhando, e pode virar a olhar novas direções;
2. O robô deve ignorar quaisquer comandos que o fariam cair da mesa;
3. O robô consegue dizer onde ele está em cima da mesa (sua posição) e qual direção está olhando;
4. O robô recebe uma lista de comandos de quais ações tomar a partir de um arquivo que especificamos.

## Uma abordagem mais programática

### Sobre o arquivo

A aplicação lerá um arquivo usando um nome passado por linha de comando, onde os seguintes comandos são válidos:

1. POSICIONAR X,Y,D
2. MOVER
3. ESQUERDA
4. DIREITA
5. REPORTAR

- POSICIONAR colocar o robo na mesa na posição X (HORIZONTAL), Y (VERTICAL) na D (DIREÇÃO) NORTE, SUL, LESTE e OESTE.
- A origem (0,0) é a posição mais ao SUDOESTE.
- Todos os comandos são IGNORADOS até um POSICIONAR válido ser passado.
- MOVER irá mover o robô uma unidade para a frente na direção que o robô estiver olhando no momento.
- ESQUERDA e DIREITA rotacionar o robô 90 graus na direção especificada, sem mudar a posição do robô.
- REPORTAR anuncia o X, Y e D atual do robô.

Como Por fim, o arquivo assume codificação ASCII. POSICIONAR tem somente um espaço, ou seja, "POSICIONAR 1, 2, NORTE" é um comando inválido. O correto seria "POSICIONAR 1,2,NORTE". Todos os comandos devem ser UPPERCASE, e todos os comandos com lowercase ou MixedCase são ignorados.

