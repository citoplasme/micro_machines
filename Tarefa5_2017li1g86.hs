{-|
Module      : Tarefa5_2017li1g86
Description : Módulo da Tarefa 5 para LI1 17/18
Copyright   : João Pimentel <a80874@alunos.uminho.pt>
              Rafaela Soares <a79034@alunos.uminho.pt>

Módulo para a realização da __Tarefa 5__ de LI1 em 2017/18.
-}

module Main where 

import Graphics.Gloss 
import Graphics.Gloss.Interface.Pure.Game
import Graphics.Gloss.Data.Picture
import LI11718
import Tarefa3_2017li1g86 
import Tarefa4_2017li1g86 

{- | 

'game' é um 'Jogo' definido por: Jogo{mapa = (Mapa ((2,1),Este) tab),pista = prop,carros = [carro1,carro2,carro3,carro4],nitros = [0,0,0,0],historico = [[],[],[],[]]} 

-} 
game :: Jogo
game = Jogo{mapa = (Mapa ((2,1),Este) tab),pista = prop,carros = [carro1,carro2,carro3,carro4],nitros = [4,4,4,4],historico = [[],[],[],[]]}
{- | 

'prop' são 'Propriedades' definidas por: Propriedades {k_atrito = 0.0,k_pneus = 0.0,k_acel = 0.0,k_peso = 0.0,k_nitro = 0.0,k_roda = 0.0}

-} 
prop :: Propriedades
prop = Propriedades {k_atrito = 2.0,k_pneus = 3.0,k_acel = 4.0,k_peso = 2.0,k_nitro = 15.0,k_roda = 180.0}

{- | 

'tab' é um 'Tabuleiro' definido por: [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca Recta 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca Recta 1,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Recta 0,Peca Lava 0],[Peca Lava 0,Peca Recta 1,Peca Lava 0,Peca (Curva Norte) 2,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Recta 2,Peca Lava 0,Peca Recta 2,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 2,Peca Recta 2,Peca (Curva Sul) 2,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]

-} 
tab :: Tabuleiro
tab = [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca Recta 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca Recta 1,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Recta 0,Peca Lava 0],[Peca Lava 0,Peca Recta 1,Peca Lava 0,Peca (Curva Norte) 2,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Recta 2,Peca Lava 0,Peca Recta 2,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 2,Peca Recta 2,Peca (Curva Sul) 2,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]

-- fazer funcao radnom que escolha um certo mapa a partir de uns pre definidos, 
-- para que seja sempre difernete ao comecar ym novo jogo
  
{- | 

'carro1' é um 'Carro' definido por: Carro  {posicao  =  (2.5,1.1) ,direcao  =  0,velocidade  =  (1,0)}

-}   
carro1 :: Carro
carro1  =  Carro  {posicao  =  (2.5,1.1) ,direcao  =  0,velocidade  =  (0,0)}
{- | 

'carro2' é um 'Carro' definido por: Carro  {posicao  =  (2.5,1.35) ,direcao  =  0,velocidade  =  (1,0)}

-}  
carro2 :: Carro
carro2  =  Carro  {posicao  =  (2.5,1.35) ,direcao  =  0,velocidade  =  (0,0)}
{- | 

'carro3' é um 'Carro' definido por: Carro  {posicao  =  (2.5,1.6) ,direcao  =  0,velocidade  =  (1,0)}

-}  
carro3 :: Carro
carro3  =  Carro  {posicao  =  (2.5,1.6) ,direcao  =  0,velocidade  =  (0,0)}
{- | 

'carro4' é um 'Carro' definido por: Carro  {posicao  =  (2.5,1.85) ,direcao  =  0,velocidade  =  (1,0)}

-} 
carro4 :: Carro
carro4  =  Carro  {posicao  =  (2.5,1.85) ,direcao  =  0,velocidade  =  (0,0)}



-- ALTERAR ESTADO DE MODO A USAR UM JOGO
-- (Jogo {mapa = m, pista = prop, carros = [car], nitros = [tempo], historico = [[pos]]})

{- | 

'Estado' é definido por: (Jogo, Tabuleiro, Picture, Picture, Picture, Picture, Picture, Picture,Picture, Picture, Picture, Picture, Picture, Picture, Picture, Picture, Float)

-} 
type Estado = (Jogo, Tabuleiro, Picture, Picture, Picture, Picture, Picture, Picture,Picture, Picture, Picture, Picture, Picture, Picture, Picture, Picture, Float)

-- tabuleiro, recta, CN,CS,CE,CO,Rampa,Lava, tempo
--type Estado = (Tabuleiro, Picture, Picture, Picture, Picture, Picture, Picture,Picture, Picture, Picture, Picture, Picture,Carro,Float)
{- | 

'Estado2' é definido por: ([Peca], Picture, Picture, Picture, Picture, Picture,Picture, Picture, Picture, Picture, Picture)

-} 
type Estado2 = ([Peca], Picture, Picture, Picture, Picture, Picture,Picture, Picture, Picture, Picture, Picture)


-- da tamanho do tabuleiro em termos de colunas
{- | 

A função 'getsize' recebe um 'Estado' e devolve um 'Float' com o seu número de colunas.

-}
getsize :: Estado -> Float
getsize (game,(x:xs),recta, cn,cs,ce,co,rampaN,rampaE,rampaO,rampaS,lava,car1,car2,car3,car4,time) = fromIntegral (length x)
-- devolve o estado inicial
{- | 

A função 'estadoInicial' gera o estado inicial do 'Estado'.

-}
estadoInicial :: IO Estado
estadoInicial = do
    recta <- loadBMP "models/recta.bmp"
    lava <- loadBMP "models/lava.bmp"
    co <- loadBMP "models/co.bmp"
    ce <- loadBMP "models/ce.bmp"
    cs <- loadBMP "models/cs.bmp"
    cn <- loadBMP "models/cn.bmp"
    rampaN <- loadBMP "models/rampaN.bmp"
    rampaS <- loadBMP "models/rampaS.bmp"
    rampaE <- loadBMP "models/rampaE.bmp"
    rampaO <- loadBMP "models/rampaO.bmp"
    car1 <- loadBMP "models/Red.bmp" 
    car2 <- loadBMP "models/Blue.bmp" 
    car3 <- loadBMP "models/Yellow.bmp" 
    car4 <- loadBMP "models/Green.bmp" 
    return (Jogo{mapa = (Mapa ((2,1),Este) tab),pista = prop,carros = [carro1,carro2,carro3,carro4],nitros = [4,4,4,4],historico = [[],[],[],[]]},tab,recta,cn,cs,ce,co,rampaN,rampaE,rampaO,rampaS,lava,car1,car2,car3,car4,60)

-- TAb esta a ficar com dim 680*680
-- Falta caso em que carro vai para a lava
{- | 

A função 'desenhaEstado' recebe um 'Estado' e transforma-o numa 'Picture', ou seja, desenha o estado.

-}
desenhaEstado :: Estado -> Picture
desenhaEstado e = if (time e <= 0) then Pictures $ [Translate (-370) 0 (Scale 0.9 0.9 (Text $ "GAME OVER!"))]   
  else scale (680 / (220 * (getsize e))) (680 / (220 * (getsize e))) (Pictures $ desenhaMapa (auxdesenhaEstado e) 0 0 220 (getsize e) ++ (desenhaCarro e) ++ [mostratempo e]) where 

  mostratempo e@(game,tab,recta,cn,cs,ce,co,rampaN,rampaE,rampaO,rampaS,lava,car1,car2,car3,car4,time) = Translate (-(((getsize e)*220)/2) + ((((getsize e))*220))) ((((getsize e)*220/2) - 220)) (Scale 0.5 0.5 $ Text $ show $ round $ time)

{- | 

A função 'time' recebe um 'Estado' e devolve o tempo remanescente de jogo.

-}
time :: Estado -> Float
time (game,tab,recta,cn,cs,ce,co,rampaN,rampaE,rampaO,rampaS,lava,car1,car2,car3,car4,time) = time

-- sendo size o getsize e
{- | 

A função 'desenhaCar' desenha o 'Carro' que recebe na respectiva posição do tabuleiro.

-}
desenhaCar :: Carro -> Int -> Float -> Picture -> Picture
desenhaCar (Carro {posicao =(x,y), direcao = ang, velocidade =(v1,v2)}) number size carro = Translate (-(size*220/2 + 110) + ((realToFrac x)*220)) ((size*220/2 + 110) - ((realToFrac y)*220)) (Rotate (realToFrac ang)  carro)

{- | 

A função 'desenhaCarro' desenha os 'Carros' existentes no 'Estado' através do uso da função 'desenhaCar'. 

-}
desenhaCarro :: Estado -> [Picture] 
desenhaCarro e@(Jogo{mapa = (Mapa ((2,1),Este) t),pista = prop,carros = car,nitros = nit,historico = hist},tab,recta,cn,cs,ce,co,rampaN,rampaE,rampaO,rampaS,lava,car1,car2,car3,car4,time)  = aux e car 1 (getsize e) where
  aux :: Estado -> [Carro] -> Int -> Float -> [Picture]
  aux e [] _ _ = []
  aux e@(game,tab,recta,cn,cs,ce,co,rampaN,rampaE,rampaO,rampaS,lava,car1,car2,car3,car4,time) (h:t) number size | number == 1 = desenhaCar h number size car1 : aux e t (number + 1) size
                                                                                                                 | number == 2 = desenhaCar h number size car2 : aux e t (number + 1) size
                                                                                                                 | number == 3 = desenhaCar h number size car3 : aux e t (number + 1) size
                                                                                                                 | number == 4 = desenhaCar h number size car4 : aux e t (number + 1) size
                                                                                                                 | otherwise = []





--  Translate (-((getsize e)*220/2 + 110) + ((realToFrac x)*220)) (((getsize e)*220/2 + 110) - ((realToFrac y)*220)) (Rotate (realToFrac ang)  carro)
  

{- | 

A função 'auxdesenhaEstado' devolve uma lista de 'Picture' com as 'Pecas' do 'Tabuleiro'. 

-}  
auxdesenhaEstado :: Estado -> [Picture]
auxdesenhaEstado (_,[],_,_,_,_,_,_,_,_,_,_,_,_,_,_,_) = [] 
auxdesenhaEstado (jogo,(x:xs),recta, cn,cs,ce,co,rampaN,rampaE,rampaO,rampaS,lava,car1,car2,car3,car4,time) = picturematch (x,recta, cn,cs,ce,co,rampaN,rampaE,rampaO,rampaS,lava) ++ auxdesenhaEstado (jogo,xs,recta, cn,cs,ce,co,rampaN,rampaE,rampaO,rampaS,lava,car1,car2,car3,car4,time)
                                                                                           where picturematch :: Estado2 -> [Picture]
                                                                                                 picturematch ([],_,_,_,_,_,_,_,_,_,_) = []
                                                                                                 picturematch ((x:xs),recta, cn,cs,ce,co,rampaN,rampaE,rampaO,rampaS,lava) | tipo x == Lava = lava : picturematch (xs,recta, cn,cs,ce,co,rampaN,rampaE,rampaO,rampaS,lava)
                                                                                                                      			                                               | tipo x == Recta = recta : picturematch (xs,recta, cn,cs,ce,co,rampaN,rampaE,rampaO,rampaS,lava)
                                                                                                                      			                                               | tipo x == (Curva Norte) = cn : picturematch (xs,recta, cn,cs,ce,co,rampaN,rampaE,rampaO,rampaS,lava)                                                                                       
                                                                                                                    		  	                                               | tipo x == (Curva Este) = ce : picturematch (xs,recta, cn,cs,ce,co,rampaN,rampaE,rampaO,rampaS,lava)                                                                                       
                                                                                                                    		  	                                               | tipo x == (Curva Oeste) = co : picturematch (xs,recta, cn,cs,ce,co,rampaN,rampaE,rampaO,rampaS,lava)                                                                                       
                                                                                                                    		  	                                               | tipo x == (Curva Sul) = cs : picturematch (xs,recta, cn,cs,ce,co,rampaN,rampaE,rampaO,rampaS,lava)                                                                                       
                                                                                                                    		  	                                               | tipo x == (Rampa Norte) = rampaN : picturematch (xs,recta, cn,cs,ce,co,rampaN,rampaE,rampaO,rampaS,lava)                                                                                       
                                                                                                                    		  	                                               | tipo x == (Rampa Este) = rampaE : picturematch (xs,recta, cn,cs,ce,co,rampaN,rampaE,rampaO,rampaS,lava)                                                                                       
                                                                                                                    		  	                                               | tipo x == (Rampa Oeste) = rampaO : picturematch (xs,recta, cn,cs,ce,co,rampaN,rampaE,rampaO,rampaS,lava)                                                                                       
                                                                                                                    		  	                                               | tipo x == (Rampa Sul) = rampaS : picturematch (xs,recta, cn,cs,ce,co,rampaN,rampaE,rampaO,rampaS,lava)                                                                                       
                                                                                                                    		  	                                               | otherwise = picturematch (xs,recta, cn,cs,ce,co,rampaN,rampaE,rampaO,rampaS,lava)

--mapa em pictures, linha, coluna, pixelsize das imagens e tamanho do mapa 
-- (auxdesenhaestado e) 0 0 60 (getsize e)
{- | 

A função 'desenhaMapa' recebe a lista gerada pela 'auxdesenhaEstado' e coloca-as nas posições pretendidas. 
-}  
desenhaMapa :: [Picture] -> Float -> Float -> Float -> Float -> [Picture]
desenhaMapa [] _ _ _ _ = [] 
desenhaMapa (x:xs) l c ps k | c == (k - 1) = Translate (-((k*ps)/2) + (c*ps)) ((k*ps/2) - (l*ps)) x : desenhaMapa xs (l+1) 0 ps k 
                            | otherwise = Translate ((-((k*ps)/2)) + (c*ps)) ((k*ps/2) - (l*ps)) x : desenhaMapa xs l (c+1) ps k
 
-- usar movimenta
-- nao estao a mexer
{- | 

A função 'reageEvento' recebe um 'Event' e um 'Estado', retornando o novo 'Estado', consoante a alteração vinda do evento. 

-}  
reageEvento  ::  Event  ->  Estado  ->  Estado 
reageEvento  (EventKey  (SpecialKey  KeyUp)     Down  _  _)  (jogo,tab,recta,cn,cs,ce,co,rampaN,rampaE,rampaO,rampaS,lava,car1,car2,car3,car4,time) = (atualizaMovimenta 0.05 jogo a1,tab,recta,cn,cs,ce,co,rampaN,rampaE,rampaO,rampaS,lava,car1,car2,car3,car4,time)
reageEvento  (EventKey  (SpecialKey  KeyDown)   Down  _  _)  (jogo,tab,recta,cn,cs,ce,co,rampaN,rampaE,rampaO,rampaS,lava,car1,car2,car3,car4,time) = (atualizaMovimenta 0.05 jogo a2,tab,recta,cn,cs,ce,co,rampaN,rampaE,rampaO,rampaS,lava,car1,car2,car3,car4,time)
reageEvento  (EventKey  (SpecialKey  KeyLeft)   Down  _  _)  (jogo,tab,recta,cn,cs,ce,co,rampaN,rampaE,rampaO,rampaS,lava,car1,car2,car3,car4,time) = (atualizaMovimenta 0.05 jogo a3,tab,recta,cn,cs,ce,co,rampaN,rampaE,rampaO,rampaS,lava,car1,car2,car3,car4,time)
reageEvento  (EventKey  (SpecialKey  KeyRight)  Down  _  _)  (jogo,tab,recta,cn,cs,ce,co,rampaN,rampaE,rampaO,rampaS,lava,car1,car2,car3,car4,time) = (atualizaMovimenta 0.05 jogo a4,tab,recta,cn,cs,ce,co,rampaN,rampaE,rampaO,rampaS,lava,car1,car2,car3,car4,time)
reageEvento  _  s  =  s  --  ignora  qualquer  outro  evento    

{- | 

A função 'reageTempo' retira o 'Float' que recebe ao 'Tempo' existente no 'Estado'.

-}  
reageTempo  ::  Float  ->  Estado  -> Estado 
reageTempo  n  (game,tab,recta, cn,cs,ce,co,rampaN,rampaE,rampaO,rampaS,lava,car1,car2,car3,car4,time)  = (atualizaMovimenta (realToFrac n) game a5,tab,recta, cn,cs,ce,co,rampaN,rampaE,rampaO,rampaS,lava,car1,car2,car3,car4,time - n) 
{- | 

'fr' são os frames por segundo.

-}  
fr  ::  Int
fr  =  50
{- | 

'dm' é a dimensão da janela do jogo.

-} 
dm  ::  Display 
dm  =  InWindow  "Micro Machines"  (800,  800)  (0,  0)
 

{-|
Função principal usada para animar um jogo completo.
Compilar com o GHC.
-}
main :: IO ()
main = do inicio <- estadoInicial                        
          play dm 
               (greyN 0.7) 
               fr 
               inicio
               desenhaEstado 
               reageEvento      --  reage  a  um  evento            
			   reageTempo  

{- | 

'a1' é uma '[Acao]' definido por: [acao4,acao2,acao2,acao2].

-} 
a1 :: [Acao]
a1 = [acao4,acao2,acao2,acao2]
{- | 

'a2' é uma '[Acao]' definido por: [acao5,acao2,acao2,acao2].

-} 
a2 :: [Acao]
a2 = [acao5,acao2,acao2,acao2]
{- | 

'a3' é uma '[Acao]' definido por: [acao6,acao2,acao2,acao2].

-} 
a3 :: [Acao]
a3 = [acao6,acao2,acao2,acao2]
{- | 

'a4' é uma '[Acao]' definido por: [acao7,acao2,acao2,acao2].

-} 
a4 :: [Acao]
a4 = [acao7,acao2,acao2,acao2]
{- | 

'a5' é uma '[Acao]' definido por: [acao2,acao2,acao2,acao2].

-} 
a5 :: [Acao]
a5 = [acao2,acao2,acao2,acao2]

{- | 

'acao5' é uma 'Acao' definido por: Acao {acelerar = False, travar = True, esquerda= False, direita= False, nitro = Nothing}

-} 
acao5 :: Acao
acao5 = Acao {acelerar = False, travar = True, esquerda= False, direita= False, nitro = Nothing}
{- | 

'acao6' é uma 'Acao' definido por: Acao {acelerar = False, travar = False, esquerda= True, direita= False, nitro = Nothing}

-} 
acao6 :: Acao
acao6 = Acao {acelerar = False, travar = False, esquerda= True, direita= False, nitro = Nothing}
{- | 

'acao7' é uma 'Acao' definido por: Acao {acelerar = False, travar = False, esquerda= False, direita= True, nitro = Nothing}

-} 
acao7 :: Acao
acao7 = Acao {acelerar = False, travar = False, esquerda= False, direita= True, nitro = Nothing}

{- | 

A função 'atualizaMovimenta' atualiza o estado do jogo, através do uso das funções principais das Tarefas 3 e 4. 

-}
atualizaMovimenta  ::  Tempo  ->  Jogo  ->  [Acao]  ->  Jogo 
atualizaMovimenta  t  jogo  a  =  novoJogo    where  
  jogoAct    = atualizar t jogo a                 
  novoJogo   = movimentar t jogoAct   
    
{- | 

A função 'atualizar' aplica a função 'atualiza' da Tarefa 4 a todos os jogadores.

-}             
atualizar :: Tempo -> Jogo -> [Acao] -> Jogo
atualizar t jog [] = jog
atualizar time jog (h:t) = aux time jog 0 (h:t) where
  aux :: Tempo -> Jogo -> Int -> [Acao] -> Jogo
  aux time jog x [] = jog
  aux time jog x (h:t) = aux time (atualiza time jog x h) (x+1) t
{- | 

A função 'movimentar' aplica a função 'movimenta' da Tarefa 3 a todos os jogadores.

-}  
movimentar :: Tempo -> Jogo -> Jogo
movimentar time jog = aux time jog 0 where
  aux :: Tempo -> Jogo -> Int -> Jogo
  aux time jog x | (x > 3) = jog
                 | otherwise = aux time (aux2 jog x (movimenta (tabuleiro jog) time ((carros jog) !! x) )) (x+1) where
    aux2 :: Jogo -> Int -> Maybe Carro -> Jogo
    aux2 jogo@(Jogo {mapa = m, pista = prop, carros = car, nitros = tempo, historico = pos}) x Nothing = (Jogo {mapa = m, pista = prop, carros = change2 car x (revive (car !! x) (posit jogo x)), nitros = tempo, historico = pos})-- put car x on last position of hist
    aux2 (Jogo {mapa = m, pista = prop, carros = car, nitros = tempo, historico = pos}) x carro = (Jogo {mapa = m, pista = prop, carros = change2 car x (fromJust2 carro), nitros = tempo, historico = pos}) -- change car x on jog using fromJust2

{- | 

A função 'fromJust2' recebe um __Maybe Carro__ e devolve um 'Carro', quando o input é diferente de __Nothing__.

-}  
fromJust2 :: Maybe Carro -> Carro
fromJust2 (Just a) = a
fromJust2 Nothing = error "Oops, something went wrong" 
{- | 

A função 'revive' recebe um 'Carro' e uma 'Posicao', colocando o 'Carro' na mesma, com angulo 0 e velocidade (0,0).

-}  
revive :: Carro -> Posicao -> Carro
revive (Carro{posicao  =  (x,y),direcao  =  ang,velocidade  =  (v1,v2)}) (a,b) = Carro{posicao  =  ((fromIntegral a)+0.5,(fromIntegral b)+0.5),direcao  =  0,velocidade  =  (0,0)} 
{- | 

A função 'posit' tira a última 'Posicao' de um certo 'Carro'.

-}  
posit :: Jogo -> Int -> Posicao
posit jogo@(Jogo {mapa = m, pista = prop, carros = car, nitros = tempo, historico = pos}) x = head (pos !! x) 
{- | 

A função 'tabuleiro' devolve o 'Tabuleiro' a partir de um certo 'Jogo'.

-}
tabuleiro :: Jogo -> Tabuleiro
tabuleiro (Jogo {mapa = (Mapa ((x,y),or) t), pista = prop, carros = car, nitros = tempo, historico = pos}) = t

