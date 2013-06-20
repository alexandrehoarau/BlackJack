Projet Blackjack :
==================
Dimitri BOUDIA
Alexandre HOARAU
Etudiants DUT Réseaux & Télécoms
2012 - 2013
--------------------------------
Projet:
--------------------------------

Projet de deux ans de DUT, permettant de limiter les pertes du joueur au Blackjack en 
incorporant une stratégie de base.

Ce programme permet tout dabord de générer un jeu de cartes, nous pouvons avec celui-ci jouer
des "mains" , celles du croupier et du joueur.

Par la suite, il va calculer les pertes du joueur et afficher la courbe de des pertes du joueur en fonction du
nombre de mains jouées.

--------------------------------
Environnement de Travail
--------------------------------

Pour éxecuter le programme vous devez disposer du logiciel MATLAB.
Il est nécessaire de vous procurez une copie légale ainsi q'un numéro de série officiel pour
l'utiliser.

--------------------------------
Description du programme MATLAB:
--------------------------------

- On génère tout d'abord plusieurs sabots de 208 cartes afin de faciliter le calcul de gain et de perte du joueur 
- On tire ensuite les cartes pour le joueur et le croupier suivant les règles c'est à dire une carte pour le croupier et deux pour le joueur
- On traite ensuite la partie concernant la prise de décision du joueur c'est à dire s'il décide de rester, tirer, doubler, partager et abandonner
- En fonction de la décision, on tire ou on reste et on tire les cartes pour le croupier car il est obligé de dépasser 17
- Il faut traiter ensuite la valeur  donnée à l'AS, si on détecte un AS et que la valeur des mains du joueur ou du croupier est supérieur à 21 on ramène la valeur de l'AS à 1 mais si la valeur des mains du joueur ou du croupier est inférieur à 21 on laisse la valeur de l'AS à 11 car elle est à 11 par défaut
- On calcul ensuite les pertes/gains du joueur en comparant la main du joueur et celle du croupier et on stock la valeur dans une variable sum
- On stock ensuite les valeurs de cette ces gains/pertes dans un vecteur sumvect
- On calcul le coefficient directeur de la courbe grâce à la fonction polyfit
- Et pour finir on trace la courbe avec la fonction plot et les vecteurs sumvect et nmain qui représente le nombre total de joueur.

Pour avoir différentes courbes et modifier la stratégie de jeu il suffit de modifier les éléments de la matrice.

0 = Abandonner

1 = Tirer une carte

2 = Rester

3 = Doubler

4 = Partager

---------------------------------
Alexandre HOARAU <a.hoarau@rt-iut.re> , Dimitri BOUDIA <d.boudia@rt-iut.re>

Blackjack Project - Limit Losses Blackjack player
Copyright (C) 2013  Dimitri BOUDIA & Alexandre HOARAU

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
