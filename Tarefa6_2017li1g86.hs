{-|
Module      : Tarefa6_2017li1g86
Description : Módulo da Tarefa 6 para LI1 17/18
Copyright   : João Pimentel <a80874@alunos.uminho.pt>
              Rafaela Soares <a79034@alunos.uminho.pt>

Módulo para a realização da __Tarefa 6__ de LI1 em 2017/18.
-}
module Tarefa6_2017li1g86 where

import LI11718
import Tarefa2_2017li1g86
import Tarefa3_2017li1g86
import Data.List
import Data.Maybe


{- | 

A função 'fromJust'' recebe um __Maybe Carro__ e devolve um 'Carro', quando o input é diferente de __Nothing__.

-}  
fromJust' :: Maybe Carro -> Carro
fromJust' (Just a) = a
fromJust' Nothing = error "Oops, you goofed up, fool." 

{- | 

'car' é um 'Carro' definido por: Carro {posicao = (1,1), direcao = 0.0, velocidade = (1.0,0.0)} 

-}  
car :: Carro
car = Carro {posicao = (1,1), direcao = 0.0, velocidade = (1.0,0.0)} 

{-|
Função usada para simular um /bot/ no jogo /Micro Machines/.
Em cada instante, dado o tempo decorrido, o estado do jogo
e o identificador do jogador, toma uma ação.
-}
bot :: Tempo  -- ^ tempo decorrido desde a última decisão
    -> Jogo   -- ^ estado atual do jogo
    -> Int    -- ^ identificador do jogador dentro do estado
    -> Acao   -- ^ a decisão tomada pelo /bot/
bot tick e@(Jogo{mapa = mapa,pista = prop,carros = cars,nitros = nit,historico = l}) j = chooseAction2 (pick2 cars j) tick mapa
	--chooseAction (association (posiToPeca (atualPosi e j) (tabuleiro mapa)) (direction mapa []))

{- | 

A função 'see' recebe um 'Carro' e um 'Tabuleiro', devolvendo a 'Peca' onde o primeiro se encontra.

__Exemplo:__

>>> see car t
Peca (Curva Norte) 0

-}  
see :: Carro -> Tabuleiro -> Peca
see carro@(Carro {posicao = (c,l), direcao = angulo, velocidade = (v1,v2)}) t = posi3 t (c,l)

{- | 

A função 'posi3' recebe um 'Tabuleiro' e um 'Ponto', devolvendo a 'Peca' na posição pretendida.

__Exemplo:__

>>> posi3 t (2.3,3.3)
Peca Recta 1

-}
posi3 :: Tabuleiro -> Ponto -> Peca
posi3 [] (x,y) = Peca Lava 0
posi3 (h:t) (x,y) = aux3 (h:t) (realCoords (x,y))  0 0 where
    aux3 :: Tabuleiro -> Posicao -> Int -> Int -> Peca
    aux3 [] (x,y) col lin = Peca Lava 0
    aux3 (h:t) (x,y) col lin | lin == y = find2 h x col
                             | otherwise = aux3 t (x,y) col (lin + 1)
{- | 

A função 'find2' __recebe__ uma /lista/ de Peca, ou seja, uma linha, e dois /Int/, sendo o primeiro a coluna que queremos e o segundo um contador. 

Devolve a Peca existente na coluna pretendida.

__Exemplo:__

>>> find' (head(tail (tab m))) 2 0
Peca Recta 0

-}
find2 :: [Peca] -> Int -> Int -> Peca
find2 [] _ _ = Peca Lava 0
find2 (h:t) x col | x == col = h
                  | otherwise = find2 t x (col + 1)  
{- | 

A função 'chooseAction2' __recebe__ um 'Carro', um 'Tempo' e um 'Mapa', devolvendo a 'Acao' que o carro deve tomar, consoante a peça onde se encontra.

__Exemplo:__

>>> chooseAction2 car 0.1 (Mapa ((2,1),Este) t)
Acao {acelerar = True, travar = False, esquerda = False, direita = True, nitro = Nothing}

-}
chooseAction2 :: Carro -> Tempo -> Mapa -> Acao
chooseAction2 car time (Mapa ((a,b),o) []) = Acao False False False False Nothing
chooseAction2 carro@(Carro {posicao = (c,l), direcao = angulo, velocidade = (v1,v2)}) time mapa@(Mapa ((a,b),o) t) | tipo2 (see (find_actual time carro) t) == Recta = Acao True False False False Nothing
				   		   	   																 | tipo2 (see (find_actual time carro) t) == Rampa Sul = Acao True False False False Nothing
				   		   	   																 | tipo2 (see (find_actual time carro) t) == Rampa Norte = Acao True False False False Nothing
				   		   	   																 | tipo2 (see (find_actual time carro) t) == Rampa Este = Acao True False False False Nothing
				   		   	   																 | tipo2 (see (find_actual time carro) t) == Rampa Oeste = Acao True False False False Nothing
				   		   	   																 | tipo2 (see (find_actual time carro) t) == Curva Norte && ori == Oeste = Acao True False True False Nothing -- curva esq
				   		   	   																 | tipo2 (see (find_actual time carro) t) == Curva Sul && ori == Este = Acao True False True False Nothing -- curva esq
				   		   	   																 | tipo2 (see (find_actual time carro) t) == Curva Este && ori == Norte = Acao True False True False Nothing -- curva esq
				   		   	   																 | tipo2 (see (find_actual time carro) t) == Curva Oeste && ori == Sul = Acao True False True False Nothing -- curva esq
				   		   	   																 | tipo2 (see (find_actual time carro) t) == Curva Norte && ori == Norte = Acao True False False True Nothing -- curva dir
				   		   	   																 | tipo2 (see (find_actual time carro) t) == Curva Sul && ori == Sul = Acao True False False True Nothing -- curva dir
				   		   	   																 | tipo2 (see (find_actual time carro) t) == Curva Este && ori == Este = Acao True False False True Nothing -- curva dir
				   		   	   																 | tipo2 (see (find_actual time carro) t) == Curva Oeste && ori == Oeste = Acao True False False True Nothing -- curva dir
				   		   	   																 | otherwise = Acao False False False False Nothing
				   		   	   															where ori = tira carro (direction mapa [])
				   		   
{- | 

A função 'tira' __recebe__ um 'Carro' e uma /lista/ de triplos '(Peca,Posicao,Orientacao)', devolvendo a __Orientação__ da peça onde o carro se encontra.

-}
tira :: Carro -> [(Peca,Posicao,Orientacao)] -> Orientacao
tira _ [] = Norte
tira carro@(Carro {posicao = (c,l), direcao = angulo, velocidade = (v1,v2)}) ((a,(x,y),ori):t) = if realCoords (c,l) == (x,y) then ori else tira carro t
{- | 

A função 'pick2' __recebe__ uma /lista/ de 'Carro' e um 'Int', devolvendo o 'Carro' na posição correspondente.

__Exemplo:__

>>> pick2 [car,carro_3] 1
Carro {posicao = (1.0,1.0), direcao = 0.0, velocidade = (1.0,0.0)}

-}
pick2 :: [Carro] -> Int -> Carro
pick2 [] _ = error "exception"
pick2 (h:t) x = if x == 1 then h else pick2 t (x-1)

{- | 

A função 'find_actual' __recebe__ um 'Tempo' e um 'Carro', devolvendo o 'Carro' na sua possível posição atualizada.

__Exemplo:__

>>> find_actual 0.1 car
Carro {posicao = (1.1,1.0), direcao = 0.0, velocidade = (1.0,0.0)}

-}
find_actual :: Tempo -> Carro -> Carro
find_actual 0 car = car
find_actual time car@(Carro {posicao  =  (x,y),direcao  =  ang,velocidade  =  (v1,v2)}) = Carro {posicao = (x + time*v1,y + time*v2) ,direcao  =  ang,velocidade  =  (v1,v2)} 

{- | 

A função 'tipo2' __recebe__ uma 'Peca' e devolve o seu 'Tipo'.

__Exemplo:__

>>> tipo2 (Peca Recta 1)
Recta

-}
tipo2 :: Peca -> Tipo
tipo2 (Peca a h) = a
