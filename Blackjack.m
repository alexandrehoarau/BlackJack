%%%Blackjack Project - Limit Losses Blackjack player
%%%Copyright (C) 2013  Dimitri BOUDIA & Alexandre HOARAU

%%%This program is free software: you can redistribute it and/or modify
%%%it under the terms of the GNU General Public License as published by
%%%the Free Software Foundation, either version 3 of the License, or
%%%(at your option) any later version.

%%%This program is distributed in the hope that it will be useful,
%%%but WITHOUT ANY WARRANTY; without even the implied warranty of
%%%MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%%%GNU General Public License for more details.

%%%You should have received a copy of the GNU General Public License
%%%along with this program.  If not, see <http://www.gnu.org/licenses/>.

%%%%%%%%%%%%% BOUDIA Dimitri & HOARAU Alexandre %%%%%%%%%%%%%%
%%%%%%%% Projet tuteuré : Comment gagner au Blackjack %%%%%%%%
%%%%%%%%%%%%%%% Programme MATLAB: Blackjack.m %%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% Description du programme %%%%%%%%%%%%%%%%%%
% Variables d'entrées : jeu (représentation du sabot de cartes) , 
%                       X1,X2 et X3 (représentation du tableau de la
%                       stratégie de base)
% Variables de sorties : joueur (main du joueur) , croupier (main du croupier) 
%                        et sum (représentation des gains
%                        et des pertes du joueur)
% Correspondances entre les éléments de la matrice et les actions:
% 0 = Abandonner
% 1 = Tirer une carte
% 2 = Rester
% 3 = Doubler
% 4 = Partager

function[] = Blackjack()

% Tableau de la stratégie de base de Monsieur M %
X1 =[0 0 0 0 0 0 0 0 0 0 0 ;
     0 0 0 0 0 0 0 0 0 0 0 ;
     0 0 0 0 0 0 0 0 0 0 0 ;
     0 0 0 0 0 0 0 0 0 0 0 ;
     0 2 2 2 2 2 2 2 2 2 0 ;%5 
     0 2 2 2 2 2 2 2 2 2 0 ;%6
     0 2 2 2 2 2 2 2 2 2 0 ;%7
     0 2 2 2 2 2 2 2 2 2 2 ;%8
     0 2 3 3 3 3 2 2 2 2 2 ;%9
     0 3 3 3 3 3 3 3 3 2 2 ;%10
     0 3 3 3 3 3 3 3 3 2 2 ;%11
     0 2 2 1 1 1 2 2 2 2 0 ;%12
     0 1 1 1 1 1 2 2 2 2 0 ;%13
     0 1 1 1 1 1 2 2 2 0 0 ;%14
     0 1 1 1 1 1 2 2 2 0 0 ;%15
     0 1 1 1 1 1 2 2 0 0 0 ;%16
     0 1 1 1 1 1 1 1 1 1 0 ;%17
     0 1 1 1 1 1 1 1 1 1 1 ;%18
     0 1 1 1 1 1 1 1 1 1 1 ;%19
     0 1 1 1 1 1 1 1 1 1 1 ;%20
     0 1 1 1 1 1 1 1 1 1 1 ];%21
     
     
     
X2 =[0 0 0 0 0 0 0 0 0 0 0 ;
     0 4 4 4 4 4 4 2 2 2 2 ;%2 2
     0 4 4 4 4 4 4 2 2 2 0 ;%3 3
     0 2 2 2 4 4 2 2 2 2 2 ;%4 4
     0 3 3 3 3 3 3 3 3 2 2 ;%5 5
     0 4 4 4 4 4 2 2 2 2 0 ;%6 6
     0 4 4 4 4 4 4 2 2 0 0 ;%7 7
     0 4 4 4 4 4 4 4 4 0 0 ;%8 8
     0 4 4 4 4 4 1 4 4 1 1 ;%9 9
     0 1 1 1 1 1 1 1 1 1 1 ;%10 10
     0 4 4 4 4 4 4 4 4 4 2 ];%A A
     
X3 =[0 0 0 0 0 0 0 0 0 0 0 ;
     0 2 2 2 3 3 2 2 2 2 2 ;%A 2
     0 2 2 2 3 3 2 2 2 2 2 ;%A 3
     0 2 2 3 3 3 2 2 2 2 2 ;%A 4
     0 2 2 3 3 3 2 2 2 2 2 ;%A 5
     0 2 3 3 3 3 2 2 2 2 2 ;%A 6
     0 1 3 3 3 3 1 1 2 2 2 ;%A 7
     0 1 1 1 1 1 1 1 1 1 1 ;%A 8
     0 1 1 1 1 1 1 1 1 1 1 ;%A 9
     0 1 1 1 1 1 1 1 1 1 1 ];%A 10

sum=0;
ntotal=0;
nmain=1;


%On génère 100 jeux de 208 cartes %
for d=1:100

jeu=zeros(208,1) ;   %on génère un jeu de 208 cartes 

    for k= 1:1
   
    n=1;             % n est le compteur du nombres total de cartes générés
    compte1 = 0;     % on inialise les compteurs à 0
    compte2 = 0;     % chaque compteur compte le nombre de carte sorti
    compte3 = 0;     % exemple : compte1 permet de compter le nombre d'AS généré etc..
    compte4 = 0;
    compte5 = 0;
    compte6 = 0;
    compte7 = 0;
    compte8 = 0;
    compte9 = 0;
    compte10 = 0;
    compte11 = 0;
    compte12 = 0;
    compte13 = 0;
    
   while n <= 208                           % ici la boucle while sera fonctionnel tant que n est inférieur ou égale à 208 
       
         Carte = randi(13) ;                %on génère des entiers au hasard de 1 à 13 et on les ajoute à la variable carte
         
        if Carte==1 && compte1< 16          % si la carte généré vaut 1 et que le compteur compte1 est inférieur à 16
            
                    compte1=compte1 + 1;    % on incrémente le compteur compte1 de 1
                        
                       jeu(n,k) = Carte;    % on ajoute la valeur de carte au vecteur jeu
                       n=n+1;               % on incrémente le compteur n de 1
        end
        
              
        if Carte==2 && compte2< 16          % les autres blocs des "if" fonctionnent comme le premier
            
                    compte2=compte2 + 1;
                    
                       jeu(n,k) = Carte;
                       n=n+1;
                       
        end
              
        if Carte==3 && compte3< 16
            
                    compte3=compte3 + 1;
                       jeu(n,k) = Carte;
                       n=n+1;
        end
              
        if Carte==4 && compte4< 16
            
                    compte4=compte4 + 1;
                       jeu(n,k) = Carte;
                       n=n+1;
        end
              
        if Carte==5 && compte5< 16
            
                    compte5=compte5 + 1;
                       jeu(n,k) = Carte;
                       n=n+1;
        end
        
         if Carte==6 && compte6< 16
            
                    compte6=compte6 + 1;
                       jeu(n,k) = Carte;
                       n=n+1;
        end
        
              
        if Carte==7 && compte7< 16
            
                    compte7=compte7 + 1;
                       jeu(n,k) = Carte;
                       n=n+1;
        end
              
        if Carte==8 && compte8< 16
            
                    compte8=compte8 + 1;
                       jeu(n,k) = Carte;
                       n=n+1;
        end
              
        if Carte==9 && compte9< 16
            
                    compte9=compte9 + 1;
                       jeu(n,k) = Carte;
                       n=n+1;
        end
              
        if Carte==10 && compte10< 16
            
                    compte10=compte10 + 1;
                       jeu(n,k) = Carte;
                       n=n+1;
         
        end
        if Carte==11 && compte11< 16
            
                   compte11=compte11 + 1;
                       jeu(n,k) = Carte;
                       n=n+1;
        end
        
          if Carte==12 && compte12< 16
            
                    compte12=compte12 + 1;
                       jeu(n,k) = Carte;
                       n=n+1;
         
        end
        if Carte==13 && compte13< 16
            
                   compte13=compte13 + 1;
                       jeu(n,k) = Carte;
                       n=n+1;
        end
        
        
   end   
% Fin du bloc concernant la génération du jeu 
   
   

% On traite les cas des figures et  de l'AS dans ce bloc   
    for j = 1:208                                                           % on parcours les lignes du vecteur jeu
        for i = 1:size(jeu,2)                                               % on parcours les colonnes du vecteur jeu
            if (jeu(j,i) == 11) || (jeu(j,i) == 12 )|| (jeu (j,i) == 13 )   % on selectionne tous les éléments 
                                                                            % du vecteur qui valent 11, 12 et 13
                jeu(j,i) = 10;                                              % et on les transforme en 10
           
            end
            if jeu(j,i) == 1                                 % On prend la valeur de l'As à 11 par défaut, le changement
                jeu(j,i) = 11;                               % se fera plus tard
            end
        end 
        
    end
    %jeu(:,1)  % afficher toutes les valeurs sorti en colonnes
    %size(jeu,1)
    end
    
    z=1;            %Représente la position de la carte dans le sabot, qui va permettre de parcourir le vecteur jeu
    nbcmptjr=1;     %Compteur du nombres de cartes du joueur
    nbcmptcrp=1;
    countcrp=0;     %Valeur totale des cartes du croupier
    countjr=0;      %Valeur totale des cartes du joueur
    f=1;
    drapeaujr=0;    %Compteur de nombre d'AS dans la main du joueur
    drapeaucrp=0;   %Compteur de nombre d'AS dans la main du croupier
    joueur=zeros(10);   %Vecteur joueur représentant les cartes dans la main du joueur
    croupier=zeros(10); %Vecteur croupier représentant les cartes dans la main du croupier
    
% On commence à jouer dans cette partie    
    while z<200        %Tant que l'on a pas parcouru tout le jeu
              
        
        if nbcmptjr<2 && countjr==0 && countcrp==0 %Si le joueur ne dispose d'aucune carte et que la valeur de ses cartes est égale à 0 
                                                   %mais aussi que la valeur des cartes du croupier
                                                   %est égale à zéro.
            
          joueur(z,1)=jeu(z,1);         %On tire une première carte pour le joueur dans le vecteur jeu à la position z 
          countjr=countjr+joueur(z,1);  %On ajoute la valeur tiré au cartes du joueur
          z=z+1;                        %On incrémente le pointeur du vecteur jeu
          nbcmptjr=nbcmptjr+1;          %On incrémente le compteur du nombre de cartes du joueur
          
          croupier(z,1)=jeu(z,1);         %On tire une carte pour le croupier dans le vecteur jeu à la position z 
          countcrp=countcrp+croupier(z,1);                                 
          z=z+1;                          %On incrémente le pointeur du vecteur jeu
          nbcmptcrp=nbcmptcrp+1;
          
          joueur(z,1)=jeu(z,1);
          countjr=countjr+joueur(z,1);
          z=z+1;                   
          nbcmptjr=nbcmptjr+1;     
% Fin du bloc concernant le tirage des cartes pour la prise de decision du
% joueur
          
joueur(:,1);
decision=0;                                    %decision est la variable qui permet de récupérer les éléments de la matrice
x=countjr;
y=countcrp;
% x
% y


% On traite la partie de la prise de décision du joueur dans ce bloc
              if countjr<22
                  decision = X1(x,y);
              end
                if decision==1
                    countjr==countjr;
                elseif decision==2
                    joueur(z,1)=jeu(z,1);
                    countjr=countjr+joueur(z,1);
                    z=z+1;                   
                    nbcmptjr=nbcmptjr+1;
                elseif decision==3
                    joueur(z,1)=jeu(z,1);
                    countjr=countjr+joueur(z,1);
                    z=z+1;                   
                    nbcmptjr=nbcmptjr+1;
%                     sum=sum+2;
                elseif decision==4
                end
% Fin du bloc de la prise de décision
                
          
          while countcrp < 17                   %Tant que la valeur des cartes du croupier est inférieur à 17
                
               croupier(z,1)=jeu(z,1);          %On tire une carte pour le croupier dans le vecteur jeu â€¡ la position z 
               countcrp=countcrp+croupier(z,1);                                 
                z=z+1;                          %On incrÃˆmente le pointeur du vecteur jeu
                nbcmptcrp=nbcmptcrp+1;
                            
          end


% On traite la partie concernant l'AS dans ce bloc
          for p = 1:size(joueur,1)              %On parcours le vecteur joueur   
                if joueur(p,1) ==  11           %Quand on tire une carte de valeur 11
                    drapeaujr=drapeaujr+1;      %On incrémente le drapeau
                end
          end
            
            if countjr>21 && drapeaujr>0        %Si la valeur totale des cartes du joueur sont supérieures à 21 et qu'il y a un drapeau
                countjr=countjr-10;             %On compte l'AS comme un 1 et non un 11
                drapeaujr=drapeaujr-1;          %On décrémente le drapeau
                if countjr<21
                    joueur(z,1)=jeu(z,1);
                    countjr=countjr+joueur(z,1);
                    z=z+1;                   
                    nbcmptjr=nbcmptjr+1; 
                end
            end
            
            for p = 1:size(croupier,1)          %On fait le même raisonnement pour les cartes du croupier
                if croupier(p,1) == 11
                    drapeaucrp=drapeaucrp+1;
                end
            end
            
            if countcrp>21 && drapeaucrp>0
                countcrp=countcrp-10;
                drapeaucrp=drapeaucrp-1;
                if countcrp<17
                   croupier(z,1)=jeu(z,1);     
                   countcrp=countcrp+croupier(z,1);                                 
                   z=z+1; 
                   nbcmptcrp=nbcmptcrp+1;
                end
            end
% Fin du traitement de l'AS            
             
                
% Partie concernant le calcul des gains/pertes du joueur
            if countjr>countcrp && countjr<=21 || countcrp>21 && countjr<=21 || countjr==21 && countcrp==21     %Les cas où le joueur gagne la partie
                sum=sum+1;                                                                                         %on a un gain
            elseif countjr<countcrp && countcrp<=21 || countjr>21                                               %Les cas où le croupier gagne 
                sum=sum-1;                                                                                         %On a une perte
            elseif countcrp>21 && countjr>21                                                                    %Le coupier et le joueur ont tous les deux dépasser 21
                sum=sum-1;                                                                                         %C'est le joueur qui perd
            elseif countjr==countcrp && countcrp<21 && countjr<21                                               %Les cas où il y a égalité
                sum=sum+0;                                                                                          %On a ni perte ni gain chacun reprend sa mise
           
            end
            sum                                                                                                 %On affiche sum pour voir les gains et pertes
            sumvect(nmain,1)=sum;
% Fin du bloc concernant le calcul des gains/pertes du joueur            
            
            
        countjr=0;
        countcrp=0;
        nbcmptjr=1;     
        nbcmptcrp=1;
        drapeaucrp=0;
        drapeaujr=0;
        joueur=zeros(10);
        croupier=zeros(10);
%         z
        
        end

        
  
  ntotal=ntotal+z;
  N(nmain,1)=nmain;
  nmain=nmain+1;
      end
    end

% On affiche le coefficient directeur de la droite et l'ordonnée à
% l'origine
 a = polyfit(N,sumvect,1)
%  Revoir l'abscisse b > car si positif pb de pente ou sinn pb de coeff a
 tendance = a(1,1)*N+a(1,2); 
% On trace la courbe des gains/pertes sur toutes les mains joués
 plot(N,sumvect);
 hold on;
 plot(N,tendance,'g');
 hold off;
end
