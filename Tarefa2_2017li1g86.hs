{- | 
Module 		: Tarefa2
Description : Módulo Haskell correspondente à Tarefa 2 de LI1
Copyright   : João Pimentel <a80874@alunos.uminho.pt>

Módulo que implementa as funções da __Tarefa 2__ de __Laboratórios de Informática 1__.
-}
module Tarefa2_2017li1g86 where

import Data.List
import LI11718
{- | 

testesT2 é um lista de 'Tabuleiro' definido por: [(tab m), (tab m2)]
-}

testesT2 :: [Tabuleiro]
testesT2 = [(tab m), (tab m2), (tab m3), (tab m4)]
{- | 

m é um 'Mapa' definido por: Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]

-}
m :: Mapa
m = Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]
{- | 

m2 é um 'Mapa' definido por: Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Lava 1,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]

-}
m2 :: Mapa
m2 = Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Lava 1,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]
{- | 

m3 é um 'Mapa' definido por: Mapa ((4,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 1,Peca (Rampa Oeste) 0,Peca Recta 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca Recta 1,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 1,Peca Lava 0,Peca (Curva Norte) 2,Peca (Rampa Oeste) 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Recta 2,Peca Lava 0,Peca Recta 2,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 2,Peca Recta 2,Peca (Curva Sul) 2,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]

-}
m3 :: Mapa
m3 = Mapa ((4,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 1,Peca (Rampa Oeste) 0,Peca Recta 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca Recta 1,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 1,Peca Lava 0,Peca (Curva Norte) 2,Peca (Rampa Oeste) 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Recta 2,Peca Lava 0,Peca Recta 2,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 2,Peca Recta 2,Peca (Curva Sul) 2,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]

{- | 

m4 é um 'Mapa' definido por: Mapa ((2,1),Este) [[Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]

-}
m4 :: Mapa
m4 = Mapa ((2,1),Este) [[Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]

{- | 

A função 'tab' __devolve__ o /Tabuleiro/ de um __Mapa__.
	
__Exemplo:__

>>> tab m
[[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]

-}
tab :: Mapa -> Tabuleiro
tab (Mapa ((x,y),ori) t) = t
{- | 

A função 'trajeto' __devolve__ uma /lista/ de pares de /(Peca, Posicao)/,que contem a primeira passagem em cada peça do trajeto, recebendo um /Mapa/ e uma /lista/ de pares de /(Peca, Posicao)/, que começa vazia.

__Exemplo:__

>>> trajeto m []
[(Peca Recta 0,(2,1)),(Peca (Curva Este) 0,(3,1)),(Peca (Rampa Sul) 0,(3,2)),(Peca (Curva Sul) 1,(3,3)),(Peca Recta 1,(2,3)),(Peca (Curva Oeste) 1,(1,3)),(Peca (Rampa Sul) 0,(1,2)),(Peca (Curva Norte) 0,(1,1))]
-}
trajeto :: Mapa -> [(Peca, Posicao)] -> [(Peca, Posicao)]
trajeto (Mapa ((x,y), orientacao) []) l = l
trajeto (Mapa ((x,y), orientacao) (h:t)) acumulada | tipo (posi2 (h:t) (x,y)) == Lava = (acumulada ++ [a])
												   | elem a acumulada == False = trajeto (new_pos (Mapa ((x,y), orientacao) (h:t))) (acumulada ++ [a]) 
												   | otherwise = acumulada
											     where a = ((posi2 (h:t) (x,y)),(x,y))
											     -- 	     where a = ((posi (h:t) (x,y) orientacao),(x,y))

{- | 

A função 'direction' __devolve__ uma /lista/ de triplos de /(Peca, Posicao, Orientacao)/,que contem a primeira passagem em cada peça do trajeto, recebendo um /Mapa/ e uma /lista/ de pares de /(Peca, Posicao, Orientacao)/, que começa vazia.

__Exemplo:__

>>> direction m []
[(Peca Recta 0,(2,1),Este),(Peca (Curva Este) 0,(3,1),Este),(Peca (Rampa Sul) 0,(3,2),Sul),(Peca (Curva Sul) 1,(3,3),Sul),(Peca Recta 1,(2,3),Oeste),(Peca (Curva Oeste) 1,(1,3),Oeste),(Peca (Rampa Sul) 0,(1,2),Norte),(Peca (Curva Norte) 0,(1,1),Norte)]
-}
direction :: Mapa -> [(Peca, Posicao, Orientacao)] -> [(Peca, Posicao, Orientacao)]
direction (Mapa ((x,y), orientacao) []) l = l
direction (Mapa ((x,y), orientacao) (h:t)) acumulada | tipo (posi2 (h:t) (x,y)) == Lava = (acumulada ++ [a])
													 | elem a acumulada == False = direction (new_pos (Mapa ((x,y), orientacao) (h:t))) (acumulada ++ [a]) 
												     | otherwise = acumulada
											       where a = ((posi2 (h:t) (x,y)),(x,y), orientacao)

{- | 

A função 'same_ori' __devolve__ um /Bool/, que depende do facto de a primeira peça do percurso e a última terem a mesma orientação. 

Baseia-se no facto de a última peça ir ter à primeira, ou seja, completar o percurso.

__Exemplo:__

>>> same_ori (direction m [])
True

-}
same_ori :: [(Peca, Posicao, Orientacao)] -> Bool
same_ori [] = True
same_ori l = if avancar2 (last l) == position (head l) then True else False

{- | 

A função 'avancar2' __devolve__ uma /Posicao/ que é obtida através do avanço da posição que recebe, consoante orientação e tipo de Peça.

Pode ter uma peça do tipo 'Lava', que depois seria usada na função 'hasnt_lava'.

__Exemplo:__

>>> avancar2 (Peca Recta 0, (2,1), Este)
(3,1)

-}
avancar2 :: (Peca, Posicao, Orientacao) -> Posicao
avancar2 (Peca tipo altura, (x,y), orientacao) | tipo == Recta = b
									     	   | tipo == Curva Norte && orientacao == Norte = avancar (x,y) (muda_dir orientacao)
									     	   | tipo == Curva Norte && orientacao == Oeste = avancar (x,y) (muda_esq orientacao)
									     	   | tipo == Curva Sul && orientacao == Sul = avancar (x,y) (muda_dir orientacao)
									     	   | tipo == Curva Sul && orientacao == Este = avancar (x,y) (muda_esq orientacao)
									     	   | tipo == Curva Este && orientacao == Este = avancar (x,y) (muda_dir orientacao)
									     	   | tipo == Curva Este && orientacao == Norte = avancar (x,y) (muda_esq orientacao)
									     	   | tipo == Curva Oeste && orientacao == Oeste = avancar (x,y) (muda_dir orientacao)
									     	   | tipo == Curva Oeste && orientacao == Sul = avancar (x,y) (muda_esq orientacao)
									     	   | tipo == Rampa Norte && orientacao == Norte = b
									     	   | tipo == Rampa Sul && orientacao == Norte = b
									     	   | tipo == Rampa Este && orientacao == Este = b
									     	   | tipo == Rampa Oeste && orientacao == Este = b
									     	   | tipo == Rampa Sul && orientacao == Sul = b
									     	   | tipo == Rampa Norte && orientacao == Sul = b
									     	   | tipo == Rampa Oeste && orientacao == Oeste = b
									     	   | tipo == Rampa Este && orientacao == Oeste = b
									     	   | otherwise = b
									   	   where b = avancar (x,y) orientacao

{- | 

A função 'position' __recebe__ um /triplo/ de /(Peca, Posicao, Orientacao)/ e devolve a sua /Posicao/.

__Exemplo:__

>>> position (Peca Recta 0, (2,1), Este)
(2,1)

-}
position :: (Peca, Posicao, Orientacao) -> Posicao
position (Peca tipo altura, (x,y), orientacao) = (x,y)
{- | 

A função 'ori' __recebe__ um /triplo/ de /(Peca, Posicao, Orientacao)/ e devolve a sua /Orientacao/.

__Exemplo:__

>>> position (Peca Recta 0, (2,1), Este)
Este

-}
ori :: (Peca, Posicao, Orientacao) -> Orientacao
ori (Peca tipo altura, (x,y), orientacao) = orientacao

{- | 

A função 'posi' __recebe__ um /Tabuleiro/, uma /Posicao/ e uma /Orientacao/ e devolve a /Peca/ nessa posicao do 'Tabuleiro'.

__Exemplo:__

>>> posi (tab m) (2,1) Este
Peca Recta 0

-}
posi :: Tabuleiro -> Posicao -> Orientacao -> Peca
posi t (x,y) orientacao = (t !! y) !! x 

{- | 

A função 'posi2' __recebe__ um /Tabuleiro/ e uma /Posicao/ e devolve a /Peca/ nessa posicao do 'Tabuleiro'.

__Exemplo:__

>>> posi2 (tab m) (3,1)
Peca (Curva Este) 0

-}
posi2 :: Tabuleiro -> Posicao -> Peca
posi2 [] (x,y) = error "exception"
posi2 (h:t) (x,y) = aux3 (h:t) (x,y) 0 0 where
	aux3 :: Tabuleiro -> Posicao -> Int -> Int -> Peca
	aux3 [] (x,y) col lin = error "exception"
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
find' [] _ _ = error "exception"
find' (h:t) x col | x == col = h
				  | otherwise = find' t x (col + 1)  

{- | 

A função 'tipo' __recebe__ uma /Peca/ e devolve o seu /Tipo/.

__Exemplo:__

>>> tipo (Peca Recta 0)
Recta

-}
tipo :: Peca -> Tipo
tipo (Peca a h) = a
{- | 

A função 'valida_alturas' __recebe__ uma /lista/ de triplos de /(Peca, Posicao, Orientacao)/ e dois /Int/, o primeiro relativo à altura inicial e o segundo serve para ir atualizando a altura, devolvendo um Bool consoante a veracidade das alturas.

__Exemplo:__

>>> valida_alturas (direction m []) 0 0
True

-}
valida_alturas :: [(Peca, Posicao, Orientacao)] -> Int -> Int -> Bool
valida_alturas [(Peca tipo altura, (x,y), orientacao)] alt atual | tipo == Rampa Norte && orientacao == Norte && atual == altura && (altura + 1) == alt = True
									     	   			     	 | tipo == Rampa Sul && orientacao == Norte && atual == (altura + 1) && altura == alt = True
									     	   			     	 | tipo == Rampa Este && orientacao == Este && atual == altura && (altura + 1) == alt = True
									     	   			     	 | tipo == Rampa Oeste && orientacao == Este && atual == (altura + 1) && altura == alt = True
									     	   			     	 | tipo == Rampa Sul && orientacao == Sul && atual == altura && (altura + 1) == alt = True
									     	   			     	 | tipo == Rampa Norte && orientacao == Sul && atual == (altura + 1) && altura == alt = True
									     	   			     	 | tipo == Rampa Oeste && orientacao == Oeste && atual == altura && (altura + 1) == alt = True
									     	   			     	 | tipo == Rampa Este && orientacao == Oeste && atual == (altura + 1) && altura == alt = True
									     	   			     	 | altura == alt = True
									     	   			     	 | otherwise = False
valida_alturas ((Peca tipo altura, (x,y), orientacao):t) alt atual | tipo == Recta && atual == altura = valida_alturas t alt altura  
									     	   | tipo == Curva Norte && orientacao == Norte && atual == altura = valida_alturas t alt altura 
									     	   | tipo == Curva Norte && orientacao == Oeste && atual == altura = valida_alturas t alt altura 
									     	   | tipo == Curva Sul && orientacao == Sul && atual == altura = valida_alturas t alt altura 
									     	   | tipo == Curva Sul && orientacao == Este && atual == altura = valida_alturas t alt altura 
									     	   | tipo == Curva Este && orientacao == Este && atual == altura = valida_alturas t alt altura 
									     	   | tipo == Curva Este && orientacao == Norte && atual == altura = valida_alturas t alt altura 
									     	   | tipo == Curva Oeste && orientacao == Oeste && atual == altura = valida_alturas t alt altura 
									     	   | tipo == Curva Oeste && orientacao == Sul && atual == altura = valida_alturas t alt altura 
									     	   | tipo == Rampa Norte && orientacao == Norte && altura == atual = valida_alturas t alt (altura + 1) 
									     	   | tipo == Rampa Sul && orientacao == Norte && (altura + 1) == atual = valida_alturas t alt altura
									     	   | tipo == Rampa Este && orientacao == Este && altura == atual = valida_alturas t alt (altura + 1) 
									     	   | tipo == Rampa Oeste && orientacao == Este && (altura + 1) == atual = valida_alturas t alt altura
									     	   | tipo == Rampa Sul && orientacao == Sul && altura == atual = valida_alturas t alt (altura + 1) 
									     	   | tipo == Rampa Norte && orientacao == Sul && (altura + 1) == atual = valida_alturas t alt altura
									     	   | tipo == Rampa Oeste && orientacao == Oeste && altura == atual = valida_alturas t alt (altura + 1) 
									     	   | tipo == Rampa Este && orientacao == Oeste && (altura + 1) == atual = valida_alturas t alt altura
									     	   | otherwise = False 

{- | 

A função 'so_pecas' __recebe__ uma /lista/ de pares de /(Peca, Posicao)/ e devolve uma /lista/ com, apenas, as /Peca/.

__Exemplo:__

>>> soPecas (trajeto m [])
[Peca Recta 0,Peca (Curva Este) 0,Peca (Rampa Sul) 0,Peca (Curva Sul) 1,Peca Recta 1,Peca (Curva Oeste) 1,Peca (Rampa Sul) 0,Peca (Curva Norte) 0]

-}
soPecas :: [(Peca, Posicao)] -> [Peca]
soPecas [] = []
soPecas ((a,(x,y)):t) = a : soPecas t

{- | 

A função 'hasnt_lava' __recebe__ uma /lista/ de pares de /(Peca, Posicao)/ e devolve um Bool, consoante a existência de peças do tipo /Lava/ na lista.

__Exemplo:__

>>> hasnt_lava (trajeto m [])
True

-}
hasnt_lava :: [(Peca, Posicao)] -> Bool
hasnt_lava [] = True
hasnt_lava l = if (elem Lava (map tipo (soPecas l)) == True) then False else True 

{- | 

A função 'alt_matrix' __recebe__ um /Tabuleiro/ e verifica se este é só constituído por peças de Lava, com altura 0, devolvendo um Bool.

__Exemplo:__

>>> alt_matrix (replicate 5 (replicate 5 (Peca Lava 0)))
True

-}
alt_matrix :: Tabuleiro -> Bool
alt_matrix [] = True
alt_matrix (h:t) = (alt_line h) && (alt_matrix t) 

{- | 

A função 'alt_line' __recebe__ uma /lista/ de /Peca/ e verifica se este é só constituído por peças de Lava, com altura 0, devolvendo um Bool.

__Exemplo:__

>>> alt_line (replicate 5 (Peca Lava 0))
True

-}
alt_line :: [Peca] -> Bool
alt_line [] = True
alt_line (h:t) | h == Peca Lava 0 = alt_line t
               | otherwise = False

-- Poe Lava na posicao, int começa a 0

{- | 

A função 'put_lava' __recebe__ uma /lista/ de /Peca/, um /Int/ (contador) e uma /Posicao/ e coloca na posicao pretendida uma peca de Lava, com altura 0.

__Exemplo:__

>>> put_lava (replicate 5 (Peca Recta 0)) 0 (2,0)
[Peca Recta 0,Peca Recta 0,Peca Lava 0,Peca Recta 0,Peca Recta 0]

-}
put_lava :: [Peca] -> Int -> Posicao -> [Peca]
put_lava [] _ _ = []
put_lava l col (x,y) | col == x = (Peca Lava 0) : tail l
					 | otherwise = (head l) : put_lava (tail l) (col + 1) (x,y)  
{- | 

A função 'puts' __recebe__ um /Tabuleiro/ e uma /lista/ de /Posicao/ e coloca nas posicões pretendida uma peca de Lava, com altura 0.

__Exemplo:__

>>> puts (tab m) (just_posi (trajeto m []))
[[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]

-}
puts :: Tabuleiro -> [Posicao] -> Tabuleiro
puts [] _ = []
puts l [] = l
puts (h:t) ((x,y):tail) = puts (aux (h:t) 0 (x,y)) tail

{- | 

A função 'aux' __recebe__ um /Tabuleiro/, um /Int/, que serve como contador da linha, uma /Posicao/ e descobre em qual linha do Tabuleiro vai chamar a função 'put_lava'.

__Exemplo:__

>>> aux (tab m) 0 (2,1)
[[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Lava 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]

-}
aux :: Tabuleiro -> Int -> Posicao -> Tabuleiro
aux [] _ (x,y) = []
aux (h:t) linha (x,y) | linha == y = (put_lava h 0 (x,y)) : t
                      | otherwise = h : aux t (linha + 1) (x,y)
{- | 

A função 'just_posi' __recebe__ uma /lista/ de /(Peca, Posicao)/ e devolve uma lista com apenas as posições.

__Exemplo:__

>>> just_posi (trajeto m [])
[(2,1),(3,1),(3,2),(3,3),(2,3),(1,3),(1,2),(1,1)]

-}
just_posi :: [(Peca, Posicao)] -> [Posicao]
just_posi [] = []
just_posi ((Peca tipo altura, (x,y)):t) = (x,y) : just_posi t

{- | 

A função 'new_pos' __recebe__ um /Mapa/ e retorna outro /Mapa/, depois de avançar uma posição consoante a posição inicial, peça e orientação.

__Exemplo:__

>>> new_pos m
Mapa ((3,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]

-}
new_pos :: Mapa -> Mapa
new_pos (Mapa ((x,y), orientacao) []) = Mapa ((x,y),orientacao) []
new_pos (Mapa ((x,y), orientacao) (h:t)) | tipo (posi (h:t) (x,y) orientacao) == Recta = Mapa (b, orientacao) (h:t)
									     | tipo (posi (h:t) (x,y) orientacao) == Curva Norte && orientacao == Norte = Mapa (avancar (x,y) (muda_dir orientacao), Este) (h:t)
									     | tipo (posi (h:t) (x,y) orientacao) == Curva Norte && orientacao == Oeste = Mapa (avancar (x,y) (muda_esq orientacao), Sul) (h:t)
									     | tipo (posi (h:t) (x,y) orientacao) == Curva Sul && orientacao == Sul = Mapa (avancar (x,y) (muda_dir orientacao), Oeste) (h:t)
									     | tipo (posi (h:t) (x,y) orientacao) == Curva Sul && orientacao == Este = Mapa (avancar (x,y) (muda_esq orientacao), Norte) (h:t)
									     | tipo (posi (h:t) (x,y) orientacao) == Curva Este && orientacao == Este = Mapa (avancar (x,y) (muda_dir orientacao), Sul) (h:t)
									     | tipo (posi (h:t) (x,y) orientacao) == Curva Este && orientacao == Norte = Mapa (avancar (x,y) (muda_esq orientacao), Oeste) (h:t)
									     | tipo (posi (h:t) (x,y) orientacao) == Curva Oeste && orientacao == Oeste = Mapa (avancar (x,y) (muda_dir orientacao), Norte) (h:t)
									     | tipo (posi (h:t) (x,y) orientacao) == Curva Oeste && orientacao == Sul = Mapa (avancar (x,y) (muda_esq orientacao), Este) (h:t)
									     | tipo (posi (h:t) (x,y) orientacao) == Rampa Norte && orientacao == Norte = Mapa (b, orientacao) (h:t)
									     | tipo (posi (h:t) (x,y) orientacao) == Rampa Sul && orientacao == Norte = Mapa (b, orientacao) (h:t)
									     | tipo (posi (h:t) (x,y) orientacao) == Rampa Este && orientacao == Este = Mapa (b, orientacao) (h:t)
									     | tipo (posi (h:t) (x,y) orientacao) == Rampa Oeste && orientacao == Este = Mapa (b, orientacao) (h:t)
									     | tipo (posi (h:t) (x,y) orientacao) == Rampa Sul && orientacao == Sul = Mapa (b, orientacao) (h:t)
									     | tipo (posi (h:t) (x,y) orientacao) == Rampa Norte && orientacao == Sul = Mapa (b, orientacao) (h:t)
									     | tipo (posi (h:t) (x,y) orientacao) == Rampa Oeste && orientacao == Oeste = Mapa (b, orientacao) (h:t)
									     | tipo (posi (h:t) (x,y) orientacao) == Rampa Este && orientacao == Oeste = Mapa (b, orientacao) (h:t)
									     | otherwise = Mapa (b, orientacao) (h:t) 
									   where b = avancar (x,y) orientacao


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

A função 'valida_lava' verifica se a moldura de um /Mapa/ é constituída por peças de Lava com altura 0.

>>>valida_lava m
True

-}
valida_lava :: Mapa -> Bool
valida_lava (Mapa (_,_) t) = aux1 (head t) && aux1 (last t) && aux2 (tail t) where
  aux1 :: [Peca] -> Bool      -- verifica se todos os elementos da primeira e última linha da matriz são todos do tipo "Lava"
  aux1 [] = True
  aux1 ((Peca x i):t) = if x == Lava && i == 0 then aux1 t else False

{- | 

A função 'aux2' verifica se o primeiro e o último elemento de cada linha da matriz é do tipo "Lava", exceto da primeira e última linha. 

>>> aux2 (tab m)
True

-}
aux2 :: [[Peca]] -> Bool   
aux2 [] = True
aux2 (h: t) = if (head h) == (Peca Lava 0) && (last h) == (Peca Lava 0)      
                          then aux2 t
                          else False       
{- | 

A função 'valida_retangulo' verifica se todas as linhas do /Mapa/ têm o mesmo número de colunas.

>>> valida_retangulo m
True

-}
valida_retangulo :: Mapa -> Bool                                       
valida_retangulo (Mapa (_,_) (h:t)) = aux (length h) t where
  aux :: Int -> [[a]] -> Bool    -- verifica se todas as linhas da matriz têm o mesmo número de elementos
  aux x [] = True                -- chegou ao fim
  aux x (h:t) = if x == (length h)
                then aux x t
                else False

{- | 

A função 'valida' verifica se um mapa é válido, usando todas as funções de validção presentes neste documento.

>>> valida m2
False

>>> valida m
True

-}
valida :: Mapa -> Bool
valida m = (valida_retangulo m) && (valida_lava m) && (aux4 m) && (same_ori (direction m [])) && (alt_matrix (puts (tab m) (just_posi (trajeto m []))))	&& (hasnt_lava (trajeto m []))		
{- | 

A função 'alt' devolve a altura da peca na cabeça da lista de /(Peca, Posicao, Orientacao)/.

>>> alt (direction  m [])
0

-}
alt :: [(Peca, Posicao, Orientacao)] -> Int
alt ((Peca tipo altura, (x,y), orientacao):t) = altura
{- | 

A função 'first' devolve a /Peca/ de um triplo /(Peca, Posicao, Orientacao)/.

>>> first (Peca (Rampa Sul) 0,(1,2),Norte)
Peca (Rampa Sul) 0

-}
first :: (Peca, Posicao, Orientacao) -> Peca
first (Peca tipo altura, (x,y), orientacao) = (Peca tipo altura)
{- | 

A função 'aux4' valida as alturas do percurso de um /Mapa/.

Tendo em consideração o caso especil em que começa numa descida.

>>> aux4 m
True

-}
aux4 :: Mapa -> Bool
aux4 m | tipo (first (head (direction m []))) == Rampa Norte && ori (head (direction m [])) == Sul = (valida_alturas (direction m []) (alt (direction m []) +1) (alt (direction m [])+1))
       | tipo (first (head (direction m []))) == Rampa Sul && ori (head (direction m [])) == Norte = (valida_alturas (direction m []) (alt (direction m []) +1) (alt (direction m [])+1))
       | tipo (first (head (direction m []))) == Rampa Este && ori (head (direction m [])) == Oeste = (valida_alturas (direction m []) (alt (direction m []) +1) (alt (direction m [])+1))
       | tipo (first (head (direction m []))) == Rampa Oeste && ori (head (direction m [])) == Este = (valida_alturas (direction m []) (alt (direction m []) +1) (alt (direction m [])+1))
       | otherwise = (valida_alturas (direction m []) (alt (direction m [])) (alt (direction m [])))


