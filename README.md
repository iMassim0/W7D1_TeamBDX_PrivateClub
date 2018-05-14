# Week n°7 on Day n°1 - THP by Team BDX - @massimo - Test Driven Development on PrivateClub

## Projet du jour :

Le projet du jour consiste à créer de toute pièce une application en pensant dès le début à la manière de tester celle-ci ! Prisée dans le monde de la programmation, la méthode de test de son app au cours de sa rédaction est une technique qui vise à réduire le temps passé à réparer les dégats, lorsque le site est de taille conséquente.

## Pré-requis et installation :

1 - Veuillez svp vous relever de votre PLS.

2 - Veuillez cloner ce repo sur votre machine avec la commande suivante (le dossier créé s'appelera "W7D1_TeamBDX_PrivateClub") :

```
  $ git clone https://github.com/iMassim0/W7D1_TeamBDX_PrivateClub
```

3 - Se rendre dans le dossier souhaité, et effectuer cette ligne de commandes suivante pour initialiser le fonctionnement :

```
  $ bundle install && rails db:migrate
```

## Conditions de test des exercices pour les corrections

Tous les exercices ont été réalisés, et devraient normalement fonctionner chez vous.
Pour cela, effectuez ces commandes pour vérifier les TDD des models && views (via system).

  - Vérification de l'exercice 2.1 :
```
  $ rails test
```

- Vérification de l'exercice 2.2 à 2.4.1 :
```
  $ rails test:system
```

  - Egalement, tu pourras vérifier "à la mano" le fonctionnement du site en lancant une version en local :
```
  $ rails server
```
Puis te rendre à l'adresse suivante :
```
  @ http://localhost:3000/
```
Et effectuer les tests que tu souhaites !

**NOTA : $ = terminal || > = console rails || @ = web browser**

## Versions

**Ruby 2.5.1**

**Rails 5.2.0**

**Bundle 1.16.1**

## Contributeur

@massimo - Maxime FLEURY

et l'aide précieuse de Mister @bab !

<p align="center">
  <img src="THP_BDX.png"/>
</p>
