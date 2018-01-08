{- | 
Module 		: Main
Description : Módulo Haskell correspondente à Tarefa 1 de LI1
Copyright   : João Pimentel <a80874@alunos.uminho.pt>

Módulo que implementa as funções da __Tarefa 1__ de __Laboratórios de Informática 1__.
-}

module Tarefa1_2017li1g86 where

import LI11718
{- | 

testesT1 é um lista de 'Caminho' definido por: [c, c2, c3, c4, c5]
-}
testesT1 :: [Caminho]
testesT1 = [c, c2, c3, c4, c5]
{- | 

c é um 'Caminho' definido por: [Avanca,CurvaDir,Sobe,CurvaDir,Avanca,CurvaDir,Desce,CurvaDir]

-}
c  ::  Caminho 
c  =  [Avanca,CurvaDir,Sobe,CurvaDir,Avanca,CurvaDir,Desce,CurvaDir]
{- | 

c2 é um 'Caminho' definido por: [Avanca, CurvaDir, Avanca, CurvaDir, Avanca, CurvaEsq, Avanca, CurvaDir, Avanca, CurvaDir, Avanca, Avanca, Avanca, CurvaDir, Avanca, Avanca]

-}
c2 :: Caminho
c2 = [Avanca, CurvaDir, Avanca, CurvaDir, Avanca, CurvaEsq, Avanca, CurvaDir, Avanca, CurvaDir, Avanca, Avanca, Avanca, CurvaDir, Avanca, Avanca]
{- | 

c3 é um 'Caminho' definido por: [Avanca, CurvaDir, Sobe, CurvaDir, Sobe, CurvaEsq, Avanca, CurvaDir, Avanca, CurvaDir, Avanca, Desce, Avanca, CurvaDir, Desce, Avanca]

-}
c3 :: Caminho
c3 = [Avanca, CurvaDir, Sobe, CurvaDir, Sobe, CurvaEsq, Avanca, CurvaDir, Avanca, CurvaDir, Avanca, Desce, Avanca, CurvaDir, Desce, Avanca]
{- | 

c4 é um 'Caminho' definido por: [Avanca, CurvaDir, Sobe, CurvaDir, Sobe, CurvaEsq, Avanca, CurvaDir, Avanca, CurvaDir, Desce, Desce,Desce, CurvaDir,Sobe, Avanca]

-}
c4 :: Caminho
c4 = [Avanca, CurvaDir, Sobe, CurvaDir, Sobe, CurvaEsq, Avanca, CurvaDir, Avanca, CurvaDir, Desce, Desce,Desce, CurvaDir,Sobe, Avanca]
{- | 

c5 é um 'Caminho' definido por: [Avanca,CurvaEsq,Sobe,CurvaEsq,Avanca,CurvaEsq,Desce,CurvaEsq]

-}
c5 :: Caminho
c5 = [Avanca,CurvaEsq,Sobe,CurvaEsq,Avanca,CurvaEsq,Desce,CurvaEsq]
{- | 

A função 'coords_caminho' __calcula__ a /lista/ dos pares /(Peca,Posicao)/, recebendo a __Posicao__, a __Orientacao__, a __Altura__ e o __Caminho__.
	
__Exemplo:__

>>> coords_caminho (2,1) Este 0 c
[(Peca Recta 0,(2,1)),(Peca (Curva Este) 0,(3,1)),(Peca (Rampa Sul) 1,(3,2)),(Peca (Curva Sul) 1,(3,3)),(Peca Recta 1,(2,3)),(Peca (Curva Oeste) 1,(1,3)),(Peca (Rampa Sul) 0,(1,2)),(Peca (Curva Norte) 0,(1,1))]

== Propriedades
coords_caminho _ _ _ [] = []
-}

coords_caminho :: Posicao -> Orientacao -> Altura -> Caminho -> [(Peca, Posicao)]
coords_caminho _ _ _ [] = []
coords_caminho posicao orientacao altura (h:t) = aux posicao orientacao altura (h:t)

{- | 

A função 'aux' é uma auxiliar da função 'coords_caminho'. 
	
== Propriedades
__Avanca__ => __(Peca Recta altura, posicao)__ seguido pela recursividade da função na posição para qual avançou.

__CurvaEsq__ ou __CurvaDir__ => __(Peca (Curva Direcao)__ seguido pela recursividade da função na posição para qual avançou.

__Sobe__ => __(Peca (Rampa Direcao) (altura + 1), posicao)__ seguido pela recursividade da função na posição para qual avançou.                     

__Desce__ => __(Peca (Rampa Direcao))__ seguido pela recursividade da função na posição para qual avançou. De notar que esta direção será contrária à do movimento, já que a rampa fica da direção oposta, quando o carro efectua uma descida.


-}
aux :: Posicao -> Orientacao -> Altura -> Caminho -> [(Peca, Posicao)]
aux _ _ _ [] = []
aux posicao orientacao altura (h:t)| h == Avanca = (Peca Recta altura, posicao) : aux (b) orientacao altura t
							                     | h == CurvaEsq && orientacao == Norte = (Peca (Curva Este) altura, posicao) : aux (c) (muda_esq orientacao) altura t
							                     | h == CurvaEsq && orientacao == Sul = (Peca (Curva Oeste) altura, posicao) : aux (c) (muda_esq orientacao) altura t
							                     | h == CurvaEsq && orientacao == Este = (Peca (Curva Sul) altura, posicao) : aux (c) (muda_esq orientacao) altura t
							                     | h == CurvaEsq && orientacao == Oeste = (Peca (Curva Norte) altura, posicao) : aux (c) (muda_esq orientacao) altura t
							                     | h == CurvaDir && orientacao == Norte = (Peca (Curva Norte) altura, posicao) : aux (d) (muda_dir orientacao) altura t
							                     | h == CurvaDir && orientacao == Sul = (Peca (Curva Sul) altura, posicao) : aux (d) (muda_dir orientacao) altura t
							                     | h == CurvaDir && orientacao == Este = (Peca (Curva Este) altura, posicao) : aux (d) (muda_dir orientacao) altura t
							                     | h == CurvaDir && orientacao == Oeste = (Peca (Curva Oeste) altura, posicao) : aux (d) (muda_dir orientacao) altura t
                                   				 | h == Sobe && orientacao == Norte = (Peca (Rampa Norte) (altura), posicao) : aux (b) orientacao (altura + 1) t
                                   				 | h == Sobe && orientacao == Sul = (Peca (Rampa Sul) (altura), posicao) : aux (b) orientacao (altura + 1) t
                                   				 | h == Sobe && orientacao == Este = (Peca (Rampa Este) (altura), posicao) : aux (b) orientacao (altura + 1) t
                                   				 | h == Sobe && orientacao == Oeste = (Peca (Rampa Oeste) (altura), posicao) : aux (b) orientacao (altura + 1) t
							                     | h == Desce && orientacao == Norte = (Peca (Rampa Sul) (altura - 1), posicao) : aux (b) orientacao (altura - 1) t
							                     | h == Desce && orientacao == Sul = (Peca (Rampa Norte) (altura - 1), posicao) : aux (b) orientacao (altura - 1) t
							                     | h == Desce && orientacao == Este = (Peca (Rampa Oeste) (altura - 1), posicao) : aux (b) orientacao (altura - 1) t
							                     | h == Desce && orientacao == Oeste = (Peca (Rampa Este) (altura - 1), posicao) : aux (b) orientacao (altura - 1) t
							                   where b = avancar posicao orientacao
							     	                 c = avancar posicao (muda_esq orientacao)
							     	                 d = avancar posicao (muda_dir orientacao)	

{- | 

A função 'avancar' é utilizada na função 'aux' e, recebendo uma Posicao e uma Orientacao, devolve a posicao para onde o carro se desloca em seguida. 
	
>>>avancar (2,1) Este
(3,1)

-}
avancar :: Posicao -> Orientacao -> Posicao
avancar (x,y) orientacao = if (orientacao == Norte) then (x,y - 1)
    else if (orientacao == Sul) then (x,y + 1)
        else if (orientacao == Este) then (x + 1,y)
            else (x - 1,y) -- orientacao == Oeste

{- | 

A função 'muda_esq' é utilizada na função 'aux' e, recebendo uma Orientacao, devolve a nova orientação após uma curva à esquerda. 
	
>>>muda_esq Norte
Oeste

-}
muda_esq :: Orientacao -> Orientacao
muda_esq a | a == Norte = Oeste
           | a == Sul = Este
           | a == Este = Norte
           | otherwise = Sul

{- | 

A função 'muda_esq' é utilizada na função 'aux' e, recebendo uma Orientacao, devolve a nova orientação após uma curva à direita. 
	
>>>muda_dir Norte
Este

-}
muda_dir :: Orientacao -> Orientacao
muda_dir a | a == Norte = Este
           | a == Sul = Oeste
           | a == Este = Sul
           | otherwise = Norte
 

{- | 

A função 'matrix_lava' constrói uma matriz só com peças do tipo Lava e as suas coordenadas, consoante a dimensão do Tabuleiro. 

>>>matrix_lava 3
[[(Peca Lava 0,(0,0)),(Peca Lava 0,(1,0)),(Peca Lava 0,(2,0))],[(Peca Lava 0,(0,1)),(Peca Lava 0,(1,1)),(Peca Lava 0,(2,1))],[(Peca Lava 0,(0,2)),(Peca Lava 0,(1,2)),(Peca Lava 0,(2,2))]]

-}
matrix_lava :: Dimensao -> [[(Peca, Posicao)]]
matrix_lava (0,0) = []
matrix_lava n =  aux_lava n 0 where
	aux_lava :: Dimensao -> Int -> [[(Peca, Posicao)]]
	aux_lava (0,0) _ = []
	aux_lava dim line = if (line < (second dim)) then (linha_lava dim line 0) : aux_lava dim (line + 1)
		else []    

{- | 

A função 'first' devolve o valor x de um par (x,y). 

>>>first (3,3)
3

-}
first :: Dimensao -> Int
first (x,y) = x
{- | 

A função 'second' devolve o valor y de um par (x,y). 

>>>first (3,4)
4

-}
second :: Dimensao -> Int
second (x,y) = y
{- | 

A função 'linha_lava' é utilizada na função 'matrix_lava' e constrói uma linha da matriz só com peças do tipo Lava e as suas coordenadas, consoante a dimensão do Tabuleiro. 

>>>linha_lava 5 0 0 
[(Peca Lava 0,(0,0)),(Peca Lava 0,(1,0)),(Peca Lava 0,(2,0)),(Peca Lava 0,(3,0)),(Peca Lava 0,(4,0))]
-}
linha_lava :: Dimensao -> Int -> Int -> [(Peca, Posicao)]
linha_lava dim line coluna = if (coluna < (first dim)) then ((Peca Lava 0), (coluna, line)) : linha_lava dim line (coluna + 1)
	else []

{- | 

A função 'altera' recebe uma matriz de pares (Peca, Posicao) e uma lista do mesmo tipo, trocando na matriz os elementos existentes pelos da lista, nas posições exatas.

>>>(altera (matrix_lava 5) (coords_caminho (2,1) Este 0 c))
[[(Peca Lava 0,(0,0)),(Peca Lava 0,(1,0)),(Peca Lava 0,(2,0)),(Peca Lava 0,(3,0)),(Peca Lava 0,(4,0))],[(Peca Lava 0,(0,1)),(Peca (Curva Norte) 0,(1,1)),(Peca Recta 0,(2,1)),(Peca (Curva Este) 0,(3,1)),(Peca Lava 0,(4,1))],[(Peca Lava 0,(0,2)),(Peca (Rampa Sul) 0,(1,2)),(Peca Lava 0,(2,2)),(Peca (Rampa Sul) 1,(3,2)),(Peca Lava 0,(4,2))],[(Peca Lava 0,(0,3)),(Peca (Curva Oeste) 1,(1,3)),(Peca Recta 1,(2,3)),(Peca (Curva Sul) 1,(3,3)),(Peca Lava 0,(4,3))],[(Peca Lava 0,(0,4)),(Peca Lava 0,(1,4)),(Peca Lava 0,(2,4)),(Peca Lava 0,(3,4)),(Peca Lava 0,(4,4))]]
-}
altera :: [[(Peca, Posicao)]] -> [(Peca, Posicao)] -> [[(Peca, Posicao)]]
altera [] l = [l]
altera l [] = l
altera l ((a,(x,y)):t) = altera (troca  l (a,(x,y))) t  

-- se a linha for maior passa para a seguinde
{- | 

A função 'troca' é chamada na função 'altera'. Recebe uma matriz de pares (Peca, Posicao) e uma par deste tipo, trocando na matriz o elemento existente pelo par, na posição pretendida.

>>>troca (matrix_lava 5) (Peca (Rampa Sul) 0, (1,2))
[[(Peca Lava 0,(0,0)),(Peca Lava 0,(1,0)),(Peca Lava 0,(2,0)),(Peca Lava 0,(3,0)),(Peca Lava 0,(4,0))],[(Peca Lava 0,(0,1)),(Peca Lava 0,(1,1)),(Peca Lava 0,(2,1)),(Peca Lava 0,(3,1)),(Peca Lava 0,(4,1))],[(Peca Lava 0,(0,2)),(Peca (Rampa Sul) 0,(1,2)),(Peca Lava 0,(2,2)),(Peca Lava 0,(3,2)),(Peca Lava 0,(4,2))],[(Peca Lava 0,(0,3)),(Peca Lava 0,(1,3)),(Peca Lava 0,(2,3)),(Peca Lava 0,(3,3)),(Peca Lava 0,(4,3))],[(Peca Lava 0,(0,4)),(Peca Lava 0,(1,4)),(Peca Lava 0,(2,4)),(Peca Lava 0,(3,4)),(Peca Lava 0,(4,4))]]
-}
troca :: [[(Peca, Posicao)]] -> (Peca, Posicao) -> [[(Peca, Posicao)]]
troca [] (a,(x,y)) = []
troca (((a,(x,y)):t):tail) (b,(c,d)) | y == d = (troca_line ((a,(x,y)):t) (b,(c,d)) ) : tail
									 | otherwise = ((a,(x,y)):t) : (troca tail (b,(c,d)))
{- | 

A função 'troca_line' é chamada na função 'troca'. Recebe uma linha da matriz de pares (Peca, Posicao) e uma par deste tipo, trocando na linha o elemento existente pelo par, na posição pretendida.

>>>troca_line [(Peca Lava 0,(0,4)),(Peca Lava 0,(1,4)),(Peca Lava 0,(2,4)),(Peca Lava 0,(3,4)),(Peca Lava 0,(4,4))] (Peca (Rampa Sul) 0, (0,4))
[(Peca (Rampa Sul) 0,(0,4)),(Peca Lava 0,(1,4)),(Peca Lava 0,(2,4)),(Peca Lava 0,(3,4)),(Peca Lava 0,(4,4))]
-}									 
troca_line :: [(Peca, Posicao)] -> (Peca, Posicao) -> [(Peca, Posicao)] 
troca_line [] _ = []
troca_line ((a,(x,y)):t) (b,(c,d)) | x == c && y == d = ((b,(c,d)):t) 
								   | x < c = (a,(x,y)) : troca_line t (b,(c,d))
{- | 

A função 'soPecas' é chamada na função 'constroi'. Recebe uma linha da matriz de pares (Peca, Posicao) e devolve apenas a lista com as Peças.

>>>soPecas [(Peca (Rampa Sul) 0,(0,4)),(Peca Lava 0,(1,4)),(Peca Lava 0,(2,4)),(Peca Lava 0,(3,4)),(Peca Lava 0,(4,4))]
[Peca (Rampa Sul) 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]
-}
soPecas :: [(Peca, Posicao)] -> [Peca]
soPecas [] = []
soPecas ((a,(x,y)):t) = a : soPecas t  

{-  

A função 'constroi' é a função principal desta Tarefa. Recebe um Caminho, a posição e orientação inicial e a dimensão do Tabuleiro. Devolve este mesmo completamente preenchido consoante o percurso do Caminho.

>>>constroi c (2,1) Este 5
[[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 1,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]
-}
--constroi :: Caminho -> Posicao -> Orientacao -> Int -> Tabuleiro
--constroi [] _ _ _ = []
--constroi c (x,y) orientacao dim = map soPecas (altera (matrix_lava dim) (coords_caminho (x,y) orientacao 0 c))



{- | 

A função 'constroi2' é a função principal desta Tarefa. Recebe um Caminho, a posição e orientação inicial e a dimensão do Tabuleiro. Devolve este mesmo completamente preenchido consoante o percurso do Caminho.

>>>constroi c
[[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 1,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]
-}
constroi2 :: Caminho -> Tabuleiro
constroi2 [] = []
constroi2 c = map soPecas (altera (matrix_lava (dimensao c)) (coords_caminho (partida c) dirInit 0 c))

{- | 

A função 'constroi3' é a função principal desta Tarefa. Recebe um Caminho, a posição e orientação inicial e a dimensão do Tabuleiro. Devolve este mesmo completamente preenchido consoante o percurso do Caminho.

>>>constroi c (2,1) Este 5
[[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 1,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]
-}
constroi :: Caminho -> Mapa
constroi [] =  error "exception"
constroi c = Mapa (partida c, Este) (constroi2 c)