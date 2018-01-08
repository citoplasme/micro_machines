{-|
Module      : Tarefa4_2017li1g86
Description : Módulo da Tarefa 4 para LI1 17/18
Copyright   : João Pimentel <a80874@alunos.uminho.pt>
              Rafaela Soares <a79034@alunos.uminho.pt>

Módulo para a realização da __Tarefa 4__ de LI1 em 2017/18.
-}
module Tarefa4_2017li1g86 where

import LI11718
import Data.List

{-|
O testes a serem considerados pelo sistema de /feedback/
para a função 'atualiza'.
-}
testesT4 :: [(Tempo,Jogo,Acao)]
testesT4 = [(0.3, game2, acao1),(0.3, game2, acao2),(0, game2, acao1),(0.3, game3, acao1),(0.3, game3, acao2),(0, game3, acao1),(0, game3, acao2),(0.3, game4, acao3),(0.3, game4, acao4),(3, game5, acao1)]
{- | 

A função 'ver_propriedades_katrito' descobre a 'Propriedade' 'k_atrito'. 

-}  
ver_propriedades_katrito :: Propriedades -> Double
ver_propriedades_katrito (Propriedades {k_atrito = at, k_pneus = p, k_acel = a, k_peso= ps, k_nitro = n, k_roda = r}) = at

{- | 

A função 'forca_atrito' atualiza o vetor da velocidade considerando o 'k_atrito', com sentido oposto ao da velocidade.

__Exemplo:__

>>> forca_atrito 2 c 0.3
(-1.494,-0.0)

-}
forca_atrito :: Double -> Carro -> Double ->(Double, Double)
forca_atrito atrit (Carro{posicao  =  (x,y),direcao  =  ang,velocidade  =  (v1,v2)}) temp = (- (atrit * v1*temp), -(atrit * v2 *temp))


{- | 

A função 'angtorad' transforma um ângulo em graus, em radianos.

__Exemplo:__

>>> angtorad 90
1.5707963267948966

-}
angtorad :: Double -> Double
angtorad ang = (ang * (2*pi)) / 360

{- | 

A função 'normaliza' mantém o ângulo entre 0º e 360º.

__Exemplo:__

>>> normaliza 370
10.0

-}
normaliza :: Double -> Double
normaliza x = if x >= 0 && x < 360 then x else if x >= 360 then normaliza (x - 360) else normaliza (x + 360) 
 

{- | 

A função 'ver_propriedades_kacel' descobre a 'Propriedade' 'k_acel'. 

-} 
ver_propriedades_kacel :: Propriedades -> Double
ver_propriedades_kacel (Propriedades {k_atrito = at, k_pneus = p, k_acel = a, k_peso= ps, k_nitro = n, k_roda = r}) = a

{- | 

A função 'forca_aceleracao' atualiza o vetor da velocidade considerando que o carro está a acelerar, com sentido e direção do carro.

__Exemplo:__

>>> forca_aceleracao 2 45  0.3
(0.4242640687119285,0.42426406871192845)

-}
forca_aceleracao :: Double -> Double -> Double -> (Double, Double)
forca_aceleracao acel ang temp = (cos (angtorad(ang)) * acel * temp, sin (angtorad(ang)) * acel * temp)

{- | 

A função 'forca_travar' atualiza o vetor da velocidade considerando que o carro está a travar, com a mesma direção e sentido oposto ao do carro.

__Exemplo:__

>>> forca_travar 2 45  0.3
(-0.4242640687119285,-0.42426406871192845)

-}
forca_travar :: Double -> Double -> Double -> (Double, Double)
forca_travar acel ang temp = (- (cos (angtorad(ang)) * acel * temp), - (sin (angtorad(ang)) * acel * temp))

{- | 

A função 'forca_ace_trav' vê se o carro está a acelarar ou a travar. Se estiver a fazer apenas um destes, calcula o vetor da força. Caso contrário, a força não é considerada.

__Exemplo:__

>>> forca_ace_trav acao4 c 1 0.3 
(0.22981333293569342,0.19283628290596178)

-}
forca_ace_trav :: Acao -> Carro -> Double  -> Double -> (Double, Double)
forca_ace_trav (Acao {acelerar = b1, travar =b2, esquerda= b3, direita= b4, nitro = n}) (Carro{posicao  =  (x,y),direcao  =  ang,velocidade  =  (v1,v2)}) acel temp  | b1 == True && b2 == True = (0,0) -- não faz nada
                                                                                                                                                                     | b1 == False && b2 == False = (0,0) -- não faz nada
                                                                                                                                                                     | b1 == True && b2 == False = forca_aceleracao acel ang temp
                                                                                                                                                                     | b2 == True && b1 == False = forca_travar acel ang temp
                                                                                                                                                                     | otherwise = (0,0)

{- | 

A função 'ver_propriedades_kpeso' descobre a 'Propriedade' 'k_peso'. 

-} 
ver_propriedades_kpeso :: Propriedades -> Double
ver_propriedades_kpeso (Propriedades {k_atrito = at, k_pneus = p, k_acel = a, k_peso= ps, k_nitro = n, k_roda = r}) = ps

{- | 

A função 'forca_gravidade' vê se o carro está numa rampa, descobrindo de que forma esta afeta o vetor velocidade do 'Carro', assumindo que as rampas têm sempre inclinação 45º.

-}
forca_gravidade :: Mapa -> Carro -> Double  -> (Double, Double)
forca_gravidade (Mapa (p,ori) t) (Carro{posicao  =  (x,y),direcao  =  ang,velocidade  =  (v1,v2)}) peso | tipo_4 ( t !! (floor y) !! (floor x)) == Rampa Norte = (-peso*cos(pi/4) + (v1*sin(pi/4)), 0 + (v2*sin(pi/4)))
                                                                                                        | tipo_4 ( t !! (floor y) !! (floor x)) == Rampa Sul = (peso*cos(pi/4) + (v1*sin(pi/4)), 0 + (v2*sin(pi/4)))
                                                                                                        | tipo_4 ( t !! (floor y) !! (floor x)) == Rampa Oeste = (0 + (v1*sin(pi/4)),-peso*cos(pi/4) + (v2*sin(pi/4))) 
                                                                                                        | tipo_4 ( t !! (floor y) !! (floor x)) == Rampa Este = (0 + (v1*sin(pi/4)) ,peso*cos(pi/4) + (v2*sin(pi/4))) 
                                                                                                        | otherwise = (v1, v2)

{- | 

A função 'diferenca_angulos' verifica a diferença entre o ângulo da direção e o ângulo da velocidade.

__Exemplo:__

>>> diferenca_angulos 47 45
-2.0

-}
diferenca_angulos :: Double -> Double -> Double
diferenca_angulos angd angv = angv - angd

{- | 

A função 'angulo_total' verifica de que forma 'k_pneus' vai afetar o 'Carro'.

-}
angulo_total :: Double -> Double -> Double
angulo_total angd angv | angd == angv = 0 -- caso os ângulos sejam iguais, os vetores sobrepõem-se. A força dos pneus não faz nada.
                       | sin((diferenca_angulos angd angv)) < 0 = angd  + 90
                       | sin((diferenca_angulos angd angv)) > 0 = angd  - 90 
                       | otherwise = 0 -- quando sin((diferenca_angulos angd angv))= 0

{- | 

A função 'angulo_velocidade' calcula o ângulo que o vetor da velocidade faz.

__Exemplo:__

>>> angulo_velocidade c
0.0

-}
angulo_velocidade :: Carro -> Double
angulo_velocidade (Carro{posicao  =  (x,y),direcao  =  ang,velocidade  =  (v1,v2)}) = atan2 v2 v1


{- | 

A função 'forca_pneus' calcula as coordenadas cartesianas da força pneus.

-}
forca_pneus :: Double -> Double -> Double -> Double -> (Double,Double)
forca_pneus anginicial angd angv pneus = (r * cos(angtorad(at)), r* sin (angtorad(at)))
 
                                             where r = sin(anginicial) * pneus
                                                   at = angulo_total angd angv

{- | 

A função 'ver_propriedades_kpneus' descobre a 'Propriedade' 'k_pneus'. 

-} 
ver_propriedades_kpneus :: Propriedades -> Double
ver_propriedades_kpneus (Propriedades {k_atrito = at, k_pneus = p, k_acel = a, k_peso= ps, k_nitro = n, k_roda = r}) = p


{- | 

A função 'tipo_4' recebe uma 'Peca' e devolve o seu 'Tipo'.

__Exemplo:__

>>> tipo_4 (Peca Lava 0)
Lava

-}
tipo_4 :: Peca -> Tipo
tipo_4 (Peca x y) = x

{- | 

A função 'soma_forcas' soma a força do atrito, da gravidade, dos pneus e da aceleração. 

-} 
soma_forcas :: (Double,Double) -> (Double,Double) -> (Double,Double) -> (Double,Double) -> (Double,Double)
soma_forcas (a,b) (c,d) (e,f) (g,h) = (a+c+e+g, b+d+f+h)

{- | 

A função 'angulo' determina o novo ângulo do carro, consoante a rotação implicada pelo 'Tempo' da 'Acao'.

-} 
angulo :: Tempo -> Double -> Double -> Acao -> Double
angulo temp ang r (Acao {acelerar = b1, travar =b2, esquerda= b3, direita= b4, nitro = n}) | b3 == True && b4 == True = ang -- não roda
                                                                                           | b3 == False && b4 == False = ang -- não roda
                                                                                           | b3 == True && b4 == False = (ang + (r*temp))
                                                                                           | b4 == True && b3 == False = (ang - (r*temp))
                                                                                           | otherwise = ang
{- | 

A função 'ver_angulo' determina o ângulo do carro, a partir deste.

__Exemplo:__

>>> ver_angulo c
40.0

-} 
ver_angulo :: Carro -> Double
ver_angulo (Carro{posicao  =  (x,y),direcao  =  ang,velocidade  =  (v1,v2)}) = ang

{- | 

A função 'ver_propriedades_kroda' descobre a 'Propriedade' 'k_roda'. 

-} 
ver_propriedades_kroda :: Propriedades -> Double
ver_propriedades_kroda (Propriedades {k_atrito = at, k_pneus = p, k_acel = a, k_peso= ps, k_nitro = n, k_roda = r}) = r

{- | 

A função 'ver2' atualiza o __Histórico__ do 'Carro' em questão.

__Exemplo:__

>>> ver2 c []
[(1,1)]

-}
ver2 :: Carro -> [Posicao] -> [Posicao]
ver2  (Carro{posicao  =  (x,y),direcao  =  ang,velocidade  =  (v1,v2)})  l = if ((elem (truncate x, truncate y) l) == True)
                                                                             then l
                                                                             else [(truncate x, truncate y)] ++ l

{- | 

A função 'change' altera um elemento na posição x da lista que recebe.

__Exemplo:__

>>> change [1,2,3,4] 1 7
[1.0,7.0,3.0,4.0]

-}
change :: [Tempo] -> Int -> Tempo -> [Tempo]
change (h:t) b a = aux (h:t) 0 b a where
  aux :: [Tempo] -> Int -> Int -> Tempo -> [Tempo]
  aux [] _ _ _ = []
  aux (h:t) n b a = if n == b then a:t else h : (aux t (n+1) b a)

{- | 

A função 'change2' altera um elemento na posição x da lista que recebe.

-}
change2 :: [Carro] -> Int -> Carro -> [Carro]
change2 (h:t) b a = aux2 (h:t) 0 b a where
  aux2 :: [Carro] -> Int -> Int -> Carro -> [Carro]
  aux2 [] _ _ _ = []
  aux2 (h:t) n b car = if n == b then car:t else h : (aux2 t (n+1) b car)

{- | 

A função 'change3' altera um elemento na posição x da lista que recebe.

-}
change3 :: [[Posicao]] -> Int -> [Posicao] -> [[Posicao]]
change3 (h:t) b l = aux3 (h:t) 0 b l where
  aux3 :: [[Posicao]] -> Int -> Int -> [Posicao] -> [[Posicao]]
  aux3 [] _ _ _ = []
  aux3 (h:t) n b l = if n == b then l:t else h : (aux3 t (n+1) b l)  

{- | 

A função 'ver_propriedades_knitro' descobre a 'Propriedade' 'k_nitro'. 

-} 
ver_propriedades_knitro :: Propriedades -> Double
ver_propriedades_knitro (Propriedades {k_atrito = at, k_pneus = p, k_acel = a, k_peso= ps, k_nitro = n, k_roda = r}) = n

{- | 

A função 'atualiza_velocidade_nitro' atualiza a velocidade do 'Carro' quando este tem um 'Nitro' ativo sobre si.

-} 
atualiza_velocidade_nitro :: Carro -> Double -> Tempo -> Carro
atualiza_velocidade_nitro (Carro{posicao  =  (x,y),direcao  =  ang,velocidade  =  (v1,v2)}) nitro temp = (Carro{posicao  =  (x,y),direcao  =  ang,velocidade  =  ( (nitro*temp)*cos(angtorad(ang)),(nitro*temp)*sin(angtorad(ang)) )})

{- | 

A função 'atualiza_tempo_nitro' atualiza o tempo de 'Nitro' restante de um 'Carro' quando este tem um 'Nitro' ativo sobre si.

-} 
atualiza_tempo_nitro :: Jogo -> Int -> Tempo -> Jogo
atualiza_tempo_nitro jogo@(Jogo {mapa = m, pista = prop, carros = car, nitros = tempo, historico = pos}) n tempoinicial | tempoinicial < (tempo !! n) = (Jogo {mapa = m, pista = prop, carros = car, nitros = change tempo n ((tempo !! n) - tempoinicial) , historico = pos}) 
                                                                                                                        | otherwise = (Jogo {mapa = m, pista = prop, carros = car, nitros = change tempo n 0 , historico = pos})               
                                                                                                                      where carro = (car !! n)                                                   
                                                                                                                            nitr = ver_propriedades_knitro prop
{- | 

A função 'nitroEffect' atualiza o 'Jogo' com as alterações devidas ao factor 'Nitro'.

-} 
nitroEffect :: Jogo -> Maybe Int -> Double -> Tempo -> Jogo
nitroEffect j Nothing nit t = j
nitroEffect j x nit 0 = j
nitroEffect jogo@(Jogo {mapa = m, pista = prop, carros = car, nitros = tempo, historico = pos}) x nit time = atualiza_tempo_nitro (Jogo {mapa = m, pista = prop, carros = change2 car (fromJust' x) (atualiza_velocidade_nitro (car !! (fromJust' x)) nit time ), nitros = tempo, historico = pos}) (fromJust' x) time

{- | 

A função 'fromJust'' recebe um __Maybe Int e devolve um __Int__, quando o input é diferente de __Nothing__.

-}  
fromJust' :: Maybe Int -> Int
fromJust' (Just a) = a
fromJust' Nothing = error "Oops, something went wrong" 

{- | 

A função 'ver_nitro' atualiza o 'Jogo' consoante a existência de 'Nitro' ativo ou não.

-} 
ver_nitro :: Jogo -> Acao -> Tempo -> Jogo    
ver_nitro jog a@(Acao {acelerar = b1, travar =b2, esquerda= b3, direita= b4, nitro = n}) tempo = if n /= Nothing then atualiza_tempo_nitro jog (fromJust' n) tempo else jog

{- | 

A função 'vector' troca o vector velocidade de um 'Carro' pelo '(Double,Double)' que recebe.

__Exemplo:__

>>> vector c (1,1)
Carro {posicao = (1.5,1.5), direcao = 40.0, velocidade = (1.0,1.0)}

-} 
vector :: Carro -> (Double,Double) -> Carro
vector (Carro{posicao  =  (x,y),direcao  =  ang,velocidade  =  (v1,v2)}) (a,b) = Carro{posicao  =  (x,y),direcao  =  ang,velocidade  =  (a,b)} 

{- | 

A função 'carro_atualizado_angulo_somaforcas' junta a atualização do ângulo e das forças.

-} 
carro_atualizado_angulo_somaforcas :: Tempo -> Carro -> (Double,Double) -> Propriedades -> Acao -> Carro
carro_atualizado_angulo_somaforcas tempo (Carro{posicao  =  (x,y),direcao  =  ang,velocidade  =  (v1,v2)}) (a1,b1) prop a = (Carro{posicao  =  (x,y),direcao  =  angnovo,velocidade  =  (a1,b1)})
                                                                                                                      where angnovo = angulo tempo ang (ver_propriedades_kroda prop) a
{- | 

'm' é um 'Mapa' definido por: Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) (-1),Peca Recta (-1),Peca (Curva Este) (-1),Peca Lava 0],[Peca Lava 0,Peca Recta (-1),Peca Lava 0,Peca Recta (-1),Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) (-1),Peca Recta (-1),Peca (Curva Sul) (-1),Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]

-} 
m :: Mapa
m = Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) (-1),Peca Recta (-1),Peca (Curva Este) (-1),Peca Lava 0],[Peca Lava 0,Peca Recta (-1),Peca Lava 0,Peca Recta (-1),Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) (-1),Peca Recta (-1),Peca (Curva Sul) (-1),Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]

{- | 

'c' é um 'Carro' definido por: Carro  {posicao  =  (1.5,1.5),direcao  =  40.0,velocidade  =  (2.49,0.0)}

-} 
c :: Carro
c = Carro  {posicao  =  (1.5,1.5),direcao  =  40.0,velocidade  =  (2.49,0.0)}
{- | 

'p' são 'Propriedades' definido por: Propriedades {k_atrito = 2.0,k_pneus = 3.0,k_acel = 4.0,k_peso = 2.0,k_nitro = 15.0,k_roda = 180.0}

-} 
p :: Propriedades
p = Propriedades {k_atrito = 2.0,k_pneus = 3.0,k_acel = 4.0,k_peso = 2.0,k_nitro = 15.0,k_roda = 180.0}
{- | 

'game1' é um 'Jogo' definido por: Jogo{mapa = Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) (-1),Peca Recta (-1),Peca (Curva Este) (-1),Peca Lava 0],[Peca Lava 0,Peca Recta (-1),Peca Lava 0,Peca Recta (-1),Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) (-1),Peca Recta (-1),Peca (Curva Sul) (-1),Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]
,pista = Propriedades {k_atrito = 2.0,k_pneus = 3.0,k_acel = 4.0,k_peso = 2.0,k_nitro = 15.0,k_roda = 180.0}
,carros = [Carro  {posicao  =  (1.5,1.5),direcao  =  40.0,velocidade  =  (2.49,0.0)}
,Carro  {posicao  =  (2.5,1.5),direcao  =  0.0,velocidade  =  (52.6,0.0)}],
nitros = [1.0,2.0],historico = [[],[(2,2)]]}
-} 
game1 :: Jogo
game1 = Jogo{mapa = Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) (-1),Peca Recta (-1),Peca (Curva Este) (-1),Peca Lava 0],[Peca Lava 0,Peca Recta (-1),Peca Lava 0,Peca Recta (-1),Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) (-1),Peca Recta (-1),Peca (Curva Sul) (-1),Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]
,pista = Propriedades {k_atrito = 2.0,k_pneus = 3.0,k_acel = 4.0,k_peso = 2.0,k_nitro = 15.0,k_roda = 180.0}
,carros = [Carro  {posicao  =  (1.5,1.5),direcao  =  40.0,velocidade  =  (2.49,0.0)}
,Carro  {posicao  =  (2.5,1.5),direcao  =  0.0,velocidade  =  (52.6,0.0)}],
nitros = [1.0,2.0],historico = [[],[(2,2)]]}

{- | 

'game2' é um 'Jogo' definido por: Jogo{mapa = Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) (-1),Peca Recta (-1),Peca (Curva Este) (-1),Peca Lava 0],[Peca Lava 0,Peca Recta (-1),Peca Lava 0,Peca Recta (-1),Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) (-1),Peca Recta (-1),Peca (Curva Sul) (-1),Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]
,pista = Propriedades {k_atrito = 2.0,k_pneus = 3.0,k_acel = 4.0,k_peso = 2.0,k_nitro = 15.0,k_roda = 180.0}
,carros = [Carro  {posicao  =  (1.5,1.5),direcao  =  40.0,velocidade  =  (2.5,0.0)}
,Carro  {posicao  =  (2.5,1.5),direcao  =  0.0,velocidade  =  (1.0,0.0)}],
nitros = [1.0,1.0],historico = [[],[(2,2)]]}
-} 
game2 :: Jogo
game2 = Jogo{mapa = Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) (-1),Peca Recta (-1),Peca (Curva Este) (-1),Peca Lava 0],[Peca Lava 0,Peca Recta (-1),Peca Lava 0,Peca Recta (-1),Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) (-1),Peca Recta (-1),Peca (Curva Sul) (-1),Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]
,pista = Propriedades {k_atrito = 2.0,k_pneus = 3.0,k_acel = 4.0,k_peso = 2.0,k_nitro = 15.0,k_roda = 180.0}
,carros = [Carro  {posicao  =  (1.5,1.5),direcao  =  40.0,velocidade  =  (2.5,0.0)}
,Carro  {posicao  =  (2.5,1.5),direcao  =  0.0,velocidade  =  (1.0,0.0)}],
nitros = [1.0,1.0],historico = [[],[(2,2)]]}

{- | 

'game3' é um 'Jogo' definido por: Jogo{mapa = Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) (-1),Peca Recta (-1),Peca (Curva Este) (-1),Peca Lava 0],[Peca Lava 0,Peca Recta (-1),Peca Lava 0,Peca Recta (-1),Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) (-1),Peca Recta (-1),Peca (Curva Sul) (-1),Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]
,pista = Propriedades {k_atrito = 2.0,k_pneus = 3.0,k_acel = 4.0,k_peso = 2.0,k_nitro = 15.0,k_roda = 180.0}
,carros = [Carro  {posicao  =  (1.5,1.5),direcao  =  40.0,velocidade  =  (2.5,0.0)}],
nitros = [0.0],historico = [[]]}
-} 
game3 :: Jogo
game3 = Jogo{mapa = Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) (-1),Peca Recta (-1),Peca (Curva Este) (-1),Peca Lava 0],[Peca Lava 0,Peca Recta (-1),Peca Lava 0,Peca Recta (-1),Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) (-1),Peca Recta (-1),Peca (Curva Sul) (-1),Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]
,pista = Propriedades {k_atrito = 2.0,k_pneus = 3.0,k_acel = 4.0,k_peso = 2.0,k_nitro = 15.0,k_roda = 180.0}
,carros = [Carro  {posicao  =  (1.5,1.5),direcao  =  40.0,velocidade  =  (2.5,0.0)}],
nitros = [0.0],historico = [[]]}

{- | 

'game4' é um 'Jogo' definido por: Jogo{mapa = Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) (-1),Peca Recta (-1),Peca (Curva Este) (-1),Peca Lava 0],[Peca Lava 0,Peca Recta (-1),Peca Lava 0,Peca Recta (-1),Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) (-1),Peca Recta (-1),Peca (Curva Sul) (-1),Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]
,pista = Propriedades {k_atrito = 2.0,k_pneus = 3.0,k_acel = 4.0,k_peso = 2.0,k_nitro = 15.0,k_roda = 180.0}
,carros = [Carro  {posicao  =  (1.5,1.5),direcao  =  0.0,velocidade  =  (1,0.0)},Carro  {posicao  =  (1.5,1.5),direcao  =  0.0,velocidade  =  (2,0.0)}],
nitros = [0.0,2.0],historico = [[],[(1,1)]]}
-} 
game4 :: Jogo
game4 = Jogo{mapa = Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) (-1),Peca Recta (-1),Peca (Curva Este) (-1),Peca Lava 0],[Peca Lava 0,Peca Recta (-1),Peca Lava 0,Peca Recta (-1),Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) (-1),Peca Recta (-1),Peca (Curva Sul) (-1),Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]
,pista = Propriedades {k_atrito = 2.0,k_pneus = 3.0,k_acel = 4.0,k_peso = 2.0,k_nitro = 15.0,k_roda = 180.0}
,carros = [Carro  {posicao  =  (1.5,1.5),direcao  =  0.0,velocidade  =  (1,0.0)},Carro  {posicao  =  (1.5,1.5),direcao  =  0.0,velocidade  =  (2,0.0)}],
nitros = [0.0,2.0],historico = [[],[(1,1)]]}
{- | 

'game5' é um 'Jogo' definido por: Jogo{mapa = Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) (-1),Peca Recta (-1),Peca (Curva Este) (-1),Peca Lava 0],[Peca Lava 0,Peca Recta (-1),Peca Lava 0,Peca Recta (-1),Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) (-1),Peca Recta (-1),Peca (Curva Sul) (-1),Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]
,pista = Propriedades {k_atrito = 2.0,k_pneus = 3.0,k_acel = 4.0,k_peso = 2.0,k_nitro = 15.0,k_roda = 180.0}
,carros = [Carro  {posicao  =  (1.5,1.5),direcao  =  10.0,velocidade  =  (2.5,0.0)}],
nitros = [0.0],historico = [[]]}
-} 
game5 :: Jogo
game5 = Jogo{mapa = Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) (-1),Peca Recta (-1),Peca (Curva Este) (-1),Peca Lava 0],[Peca Lava 0,Peca Recta (-1),Peca Lava 0,Peca Recta (-1),Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) (-1),Peca Recta (-1),Peca (Curva Sul) (-1),Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]
,pista = Propriedades {k_atrito = 2.0,k_pneus = 3.0,k_acel = 4.0,k_peso = 2.0,k_nitro = 15.0,k_roda = 180.0}
,carros = [Carro  {posicao  =  (1.5,1.5),direcao  =  10.0,velocidade  =  (2.5,0.0)}],
nitros = [0.0],historico = [[]]}
{- | 

'hist' é uma '[[Posicao]]' definida por: [[],[(2,2)]].
-} 
hist :: [[Posicao]]
hist = [[],[(2,2)]]

{- | 

'cars' é uma '[Carro]' definida por: [Carro  {posicao  =  (1.5,1.5),direcao  =  40.0,velocidade  =  (2.5,0.0)},Carro  {posicao  =  (2.5,1.5),direcao  =  0.0,velocidade  =  (1.0,0.0)}].

-} 
cars :: [Carro]
cars = [Carro  {posicao  =  (1.5,1.5),direcao  =  40.0,velocidade  =  (2.5,0.0)},Carro  {posicao  =  (2.5,1.5),direcao  =  0.0,velocidade  =  (1.0,0.0)}]

{- | 

A função 'velocity' devolve a velocidade de um 'Carro', através do mesmo.

__Exemplo:__

>>> velocity c
(2.49,0.0)

-} 
velocity :: Carro -> (Double,Double)
velocity (Carro{posicao  =  (x,y),direcao  =  ang,velocidade  =  (v1,v2)}) = (v1,v2)

{- | 

'acao1' é uma 'Acao' definido por: Acao {acelerar = False, travar = True, esquerda= False, direita= True, nitro = Nothing}

-} 
acao1 :: Acao
acao1 = Acao {acelerar = False, travar = True, esquerda= False, direita= True, nitro = Nothing}
{- | 

'acao2' é uma 'Acao' definido por: Acao {acelerar = False, travar = False, esquerda= False, direita= False, nitro = Nothing}

-} 
acao2 :: Acao
acao2 = Acao {acelerar = False, travar = False, esquerda= False, direita= False, nitro = Nothing}
{- | 

'acao3' é uma 'Acao' definido por: Acao {acelerar = False, travar = False, esquerda= False, direita= False, nitro = Just 1}

-} 
acao3 :: Acao
acao3 = Acao {acelerar = False, travar = False, esquerda= False, direita= False, nitro = Just 1}
{- | 

'acao4' é uma 'Acao' definido por:  Acao {acelerar = True, travar = False, esquerda= False, direita= False, nitro = Nothing}

-} 
acao4 :: Acao
acao4 = Acao {acelerar = True, travar = False, esquerda= False, direita= False, nitro = Nothing}
{- | 

A função 'timer' multiplica o vetor do input pelo 'Tempo'.

__Exemplo:__

>>> timer (1,1) 0.3
(0.3,0.3)

-} 
timer :: (Double,Double) -> Tempo -> (Double,Double)
timer (x,y) t = (t*x,t*y)

{-|
Função usada para atualizar o estado do jogo dadas as
ações de um jogador num determinado período de tempo.
-}
atualiza :: Tempo -> Jogo -> Int -> Acao -> Jogo
atualiza 0 jogo@(Jogo {mapa = m, pista = prop, carros = car, nitros = tempo, historico = pos}) x a = (Jogo {mapa = m, pista = prop, carros = car, nitros = tempo, historico = change3 pos x (ver2 (car !! (x)) (pos !! x))})
--atualiza t jogo@(Jogo {mapa = m, pista = prop, carros = car, nitros = tempo, historico = pos}) x a@(Acao {acelerar = False, travar =False, esquerda= False, direita= False, nitro = Nothing}) = (Jogo {mapa = m, pista = prop, carros = car, nitros = tempo, historico = change3 pos x (ver2 (car !! (x)) (pos !! x))})
atualiza temp jogo@(Jogo {mapa = m, pista = prop, carros = car, nitros = tempo, historico = pos}) jog a@(Acao {acelerar = b1, travar =b2, esquerda= b3, direita= b4, nitro = n}) = if jog < length car && temp > 0 then nitroEffect (Jogo {mapa = m, pista = prop, carros = change2 car jog (carro_atualizado_angulo_somaforcas temp (car !! jog) (forca_gravidade m (vector (car !! (jog)) (soma_forcas aa b c d)) (ver_propriedades_kpeso prop)) prop a), nitros = tempo, historico = novoh}) n (ver_propriedades_knitro prop) temp else (Jogo {mapa = m, pista = prop, carros = car, nitros = tempo, historico = change3 pos jog (ver2 (car !! (jog)) (pos !! jog))})
--if n /= Nothing then ver_nitro (Jogo {mapa = m, pista = prop, carros = change2 [car] (fromJust' n) (carro_atualizado_angulo_somaforcas temp ([car] !! jog) (forca_gravidade m (vector ([car] !! (jog-1)) (soma_forcas b c d)) (ver_propriedades_kpeso prop)) prop a), nitros = [tempo], historico = novoh}) a temp
--  else (Jogo {mapa = m, pista = prop, carros = change2 [car] jog (carro_atualizado_angulo_somaforcas temp ([car] !! (jog-1)) (forca_gravidade m (vector ([car] !! (jog-1)) (soma_forcas b c d)) ver_propriedades_kpeso prop) prop a), nitros = [tempo], historico = novoh})
                                                                                                                                                        
                                                                                                                                                                                                         where aa = forca_pneus (diferenca_angulos (ver_angulo (car !! (jog))) (angulo_velocidade (car !! (jog)))) (ver_angulo (car !! (jog))) (angulo_velocidade (car !! (jog))) (ver_propriedades_kpneus prop)
                                                                                                                                                                                                               c = forca_ace_trav a (car !! jog) (ver_propriedades_kacel prop) temp
                                                                                                                                                                                                               d = velocity (car !! jog)
                                                                                                                                                                                                               b = forca_atrito (ver_propriedades_katrito prop) (car !! jog) temp
                                                                                                                                                                                                               novoh = change3 pos jog (ver2 (car !! (jog)) (pos !! jog))
                                                                                                                                                                                                              


