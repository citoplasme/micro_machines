{- | 
Module    : Tarefa3
Description : Módulo Haskell correspondente à Tarefa 3 de LI1
Copyright   : João Pimentel <a80874@alunos.uminho.pt>
              Rafaela Soares <a79034@alunos.uminho.pt>

Módulo que implementa as funções da __Tarefa 3__ de __Laboratórios de Informática 1__.
-}
module Tarefa3_2017li1g86 where

import Data.List
import LI11718


{- | 

testesT3 é um lista de 'triplos' (Tabuleiro, Tempo, Carro) definido por: [(t, 2, carro), (t, 1, carro2), (t, 0.7, carro2), (t, 0.7, carro3), (t, 0.9, carro3), (t, 0.5, carro), (t, 0.6, carro)]

-}
testesT3 :: [(Tabuleiro,Tempo,Carro)]
testesT3 = [(t, 2, carro_3), (t, 1, carro_3_2), (t, 0.7, carro_3_2), (t, 0.7, carro_3_3), (t, 0.9, carro_3_3), (t, 0.5, carro_3), (t, 0.6, carro_3)]
{- | 

t é um 'Tabuleiro' definido por: [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]

-}
t :: Tabuleiro
t = [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]

{- | 

carro_3 é um 'Carro' definido por: Carro  {posicao  =  (2.5,1.5),direcao  =  45,velocidade  =  (0,-1)}

-}
carro_3 :: Carro
carro_3  =  Carro  {posicao  =  (2.5,1.5),direcao  =  45,velocidade  =  (0,-1)}

{- | 

carro_3_2 é um 'Carro' definido por: Carro  {posicao  =  (2.5,1.5),direcao  =  0,velocidade  =  (1,0)}

-}
carro_3_2 :: Carro
carro_3_2  =  Carro  {posicao  =  (2.5,1.5),direcao  =  0,velocidade  =  (1,0)}

{- | 

carro_3_3 é um 'Carro' definido por: Carro  {posicao  =  (2.4,1.4),direcao  =  0,velocidade  =  (1,0)}

-}
carro_3_3 :: Carro
carro_3_3  =  Carro  {posicao  =  (2.4,1.4),direcao  =  0,velocidade  =  (1,0)}

{- | 

carro_3_4 é um 'Carro' definido por: Carro  {posicao  =  (3.4,1.7),direcao  =  0,velocidade  =  (1,0)}

-}
carro_3_4 :: Carro
carro_3_4  =  Carro  {posicao  =  (3.4,1.7),direcao  =  0,velocidade  =  (1,0)}


{- | 

A função 'tipo' recebe uma 'Peca' e devolve o seu 'Tipo'.

__Exemplo:__

>>> tipo (Peca Lava 0)
Lava

-}
tipo :: Peca -> Tipo 
tipo (Peca a x) = a 

{- | 

A função 'altura' recebe uma 'Peca' e devolve a sua altura.

__Exemplo:__

>>> tipo (Peca Lava 0)
0

-}
altura :: Peca -> Int
altura (Peca x y) = y 

{- | 

A função 'nextPosition' recebe um 'Carro' e um 'Tempo', devolvendo a sua nova 'Posicao'.

__Exemplo:__

>>> nextPosition (Carro {posicao = (1.5, 1.5), direcao = 0, velocidade = (1,0)}) 1
(2.5,1.5)

-}
nextPosition :: Carro -> Tempo -> Ponto  
nextPosition (Carro {posicao = (c,l), direcao = angulo, velocidade = (v1,v2)}) t = (c + t * v1 , l + t * v2)
{- | 

A função 'realCoords' recebe um 'Ponto' e devolve a sua 'Posicao', ou seja, um par de inteiros.

__Exemplo:__

>>> realCoords (2.5,3.3)
(2,3)

-}
realCoords :: Ponto -> Posicao
realCoords (x,y) = (floor x,floor y)
{- | 

A função 'posi' recebe um 'Tabuleiro' e um 'Ponto', devolvendo a 'Peca' na posição pretendida.

__Exemplo:__

>>> posi t2 (2.3,3.3)
Peca Recta 1

-}
posi :: Tabuleiro -> Ponto -> Peca
posi [] (x,y) = Peca Lava 0
posi (h:t) (x,y) = aux3 (h:t) (realCoords (x,y))  0 0 where
    aux3 :: Tabuleiro -> Posicao -> Int -> Int -> Peca
    aux3 [] (x,y) col lin = Peca Lava 0
    aux3 (h:t) (x,y) col lin | lin == y = find' h x col
                             | otherwise = aux3 t (x,y) col (lin + 1)
{- | 

A função 'find'' __recebe__ uma /lista/ de Peca, ou seja, uma linha, e dois /Int/, sendo o primeiro a coluna que queremos e o segundo um contador. 

Devolve a Peca existente na coluna pretendida.

__Exemplo:__

>>> find' (head(tail (tab m))) 2 0
Peca Recta 0

-}
find' :: [Peca] -> Int -> Int -> Peca
find' [] _ _ = Peca Lava 0
find' (h:t) x col | x == col = h
                  | otherwise = find' t x (col + 1)  

{- | 

A função 'curva' __recebe__ uma /Peca/ e um /Carro/, devolvendo um possivel novo Carro, consoante a validade do mesmo dentro de uma curva. 

__Exemplo:__

>>> curva (Peca (Curva Este) 0) carro4 
Nothing

-}
curva :: Peca -> Carro -> Maybe Carro
curva (Peca (Curva Norte) altura) car@(Carro {posicao = (x,y), direcao = angulo, velocidade = (v1,v2)}) = if ((x - fromIntegral (floor x)) + (y - fromIntegral (floor y)) < 1) then Nothing else Just car 
curva (Peca (Curva Sul) altura) car@(Carro {posicao = (x,y), direcao = angulo, velocidade = (v1,v2)}) = if ((x - fromIntegral (floor x)) + (y - fromIntegral (floor y)) > 1) then Nothing else Just car 
curva (Peca (Curva Este) altura) car@(Carro {posicao = (x,y), direcao = angulo, velocidade = (v1,v2)}) = if ((x - fromIntegral (floor x)) + (1 - (y - fromIntegral (floor y))) > 1) then Nothing else Just car 
curva (Peca (Curva Oeste) altura) car@(Carro {posicao = (x,y), direcao = angulo, velocidade = (v1,v2)}) = if ((x - fromIntegral (floor x)) + (1 - (y - fromIntegral (floor y))) < 1) then Nothing else Just car 


{- | 

A função __movimenta__ recebe um 'Tabuleiro', um 'Tempo' e um 'Carro', devolvendo o possível novo carro apos o movimento.

__Exemplo:__

>>> movimenta t2 1 carro2
Just (Carro {posicao = (3.5,1.5), direcao = 0.0, velocidade = (1.0,0.0)})

-}

movimenta :: Tabuleiro -> Tempo -> Carro -> Maybe Carro
movimenta m t carro@(Carro {posicao = (c,l), direcao = angulo, velocidade = (v1,v2)}) 
    | actualPos == Peca Lava 0 = Nothing 
    | tipo actualPos == Curva Norte || tipo actualPos == Curva Sul || tipo actualPos == Curva Este || tipo actualPos == Curva Oeste = curva newPos Carro{posicao = newPonto, direcao = angulo, velocidade = (v1,v2)}  
    | altura actualPos - altura newPos > 0 = subida t (actualPos) (newPos) carro 
    | altura actualPos - altura newPos < 0 = Just Carro {posicao = newPonto, direcao = 180 - angulo, velocidade = (v1,v2)}
    | otherwise = Just Carro {posicao = newPonto, direcao = angulo, velocidade = (v1,v2)}
    where newPonto = nextPosition carro t
          newPos = posi m (nextPosition carro t)
          actualPos = posi m newPonto

{- | 

A função 'subida' compara as alturas quando perante situações que envolvam rampas.

-}
subida :: Tempo -> Peca -> Peca -> Carro -> Maybe Carro 
subida t (Peca tipo altura) (Peca tipo2 altura2) carro@(Carro {posicao = (c,l), direcao = angulo, velocidade = (v1,v2)})
    | tipo == tipo2 && (altura + 1) == altura2 = Just Carro {posicao = newPonto, direcao = angulo, velocidade = (v1,v2)} -- duas subidas
    | tipo == tipo2 && altura == (altura2 + 1) = Just Carro {posicao = newPonto, direcao = angulo, velocidade = (v1,v2)} -- duas descidas
    | tipo == tipo2 && altura == altura2 = Just Carro {posicao = newPonto, direcao = angulo, velocidade = (v1,v2)}
    | tipo == Rampa Norte && altura == altura2 = Just Carro {posicao = newPonto, direcao = angulo, velocidade = (v1,v2)}
    | tipo == Rampa Norte && altura + 1 == altura2 = Just Carro {posicao = newPonto, direcao = angulo, velocidade = (v1,v2)}
    | tipo == Rampa Sul && altura == altura2 = Just Carro {posicao = newPonto, direcao = angulo, velocidade = (v1,v2)}
    | tipo == Rampa Sul && altura + 1 == altura2 = Just Carro {posicao = newPonto, direcao = angulo, velocidade = (v1,v2)}
    | tipo == Rampa Este && altura == altura2 = Just Carro {posicao = newPonto, direcao = angulo, velocidade = (v1,v2)}
    | tipo == Rampa Este && altura + 1 == altura2 = Just Carro {posicao = newPonto, direcao = angulo, velocidade = (v1,v2)}
    | tipo == Rampa Oeste && altura == altura2 = Just Carro {posicao = newPonto, direcao = angulo, velocidade = (v1,v2)}
    | tipo == Rampa Oeste && altura + 1 == altura2 = Just Carro {posicao = newPonto, direcao = angulo, velocidade = (v1,v2)}
    | tipo2 == Rampa Norte && altura + 1 == altura2 = Just Carro {posicao = newPonto, direcao = angulo, velocidade = (v1,v2)}
    | tipo2 == Rampa Norte && altura == altura2 = Just Carro {posicao = newPonto, direcao = angulo, velocidade = (v1,v2)}
    | tipo2 == Rampa Sul && altura + 1 == altura2 = Just Carro {posicao = newPonto, direcao = angulo, velocidade = (v1,v2)}
    | tipo2 == Rampa Sul && altura == altura2 = Just Carro {posicao = newPonto, direcao = angulo, velocidade = (v1,v2)}
    | tipo2 == Rampa Este && altura == altura2 = Just Carro {posicao = newPonto, direcao = angulo, velocidade = (v1,v2)}
    | tipo2 == Rampa Este && altura + 1 == altura2 = Just Carro {posicao = newPonto, direcao = angulo, velocidade = (v1,v2)}
    | tipo2 == Rampa Oeste && altura == altura2 = Just Carro {posicao = newPonto, direcao = angulo, velocidade = (v1,v2)}
    | tipo2 == Rampa Oeste && altura + 1 == altura2 = Just Carro {posicao = newPonto, direcao = angulo, velocidade = (v1,v2)}
    | otherwise = Nothing
    where newPonto = nextPosition carro t
      
