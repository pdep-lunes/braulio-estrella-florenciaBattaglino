module Lib () where

import Text.Show.Functions ()

data Personaje = UnPersonaje {
    nombre :: String,
    poderBasico :: Poder,
    superPoder :: Poder,
    superActivo :: Bool,
    cantidadVida :: Int }

type Poder = Personaje -> Personaje

espinosa :: Personaje
espinosa = UnPersonaje "Espinosa" bolaEspinosa bolaEspinosa True 4800

modificarVida :: Personaje -> Int -> Personaje
modificarVida personaje vida = personaje {cantidadVida = vida}

bolaEspinosa :: Poder
bolaEspinosa contrincante = modificarVida contrincante (max (cantidadVida contrincante - 1000) 0)
  

lluviaDeTuercas :: String -> Poder
lluviaDeTuercas team personaje 
  | equipo == "colega" = modificarVida personaje (cantidadVida personaje + 800)
  | equipo == "contrincante" = modificarVida personaje (div (cantidadVida personaje) 2)
  | otherwise = personaje

