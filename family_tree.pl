female(molly_prewett).
female(druella_rosier).
female(narcissa_black).
female(astoria_greengrass).
female(bellatrix_black).
female(irma_crabbe).
female(andromeda_black).
female(nymphadora_tonks).
female(walburga_black).
female(fleur_delacour).
female(rose_weasley).
female(ginny_weasley).
female(lily_potter_II).
female(dominique_weasley).
female(audrey).
female(lucy_weasley).
female(roxanne_weasley).
female(molly_weasley_II).
female(victoire_weasley).
female(euphemia_potter).
female(lily_evans).
female(petunia_evans).
female(merope_gaunt).
female(angelina_johnson).
female(hermione_granger).


male(arthur_weasley).
male(gideon_prewett).
male(fleamont_potter).
male(morfin_gaunt).
male(vernon_dursley).
male(marvolo_gaunt).
male(tom_marvolo_riddle).
male(james_potter).
male(dudley_dursley).
male(tom_riddle_sr).
male(fabian_prewett).
male(bill_weasley).
male(pollux_black).
male(cygnus_black).
male(rodolphus_lestrange).
male(orion_black).
male(ted_tonks).
male(sirius_black).
male(scorpius_malfoy).
male(alphard_black).
male(lucius_malfoy).
male(remus_lupin).
male(teddy_lupin).
male(draco_malfoy).
male(regulus_arcturus_black).
male(fred_weasley_II).
male(george_weasley).
male(fred_weasley).
male(charlie_weasley).
male(percy_weasley).
male(louis_weasley).
male(ron_weasley).
male(hugo_weasley).
male(harry_potter).
male(james_potter_II).
male(albus_severus_potter).
male(antioch_peverell).
male(cadmus_peverell).
male(ignotus_peverell).


married(lucius_malfoy, narcissa_black).
married(ted_tonks, andromeda_black).
married(pollux_black, irma_crabbe).
married(remus_lupin, nymphadora_tonks).
married(draco_malfoy, astoria_greengrass).
married(rodolphus_lestrange, bellatrix_black).
married(cygnus_black, druella_rosier).
married(orion_black, walburga_black).
married(arthur_weasley, molly_prewett).
married(ron_weasley, hermione_granger).
married(george_weasley, angelina_johnson).
married(fleamont_potter, euphemia_potter).
married(james_potter, lily_evans).
married(tom_riddle_sr, merope_gaunt).
married(vernon_dursley, petunia_evans).
married(bill_weasley, fleur_delacour).
married(percy_weasley, audrey).
married(harry_potter, ginny_weasley).

married(X, Y) :- female(X), male(Y), married(Y, X).

husband(X, Y) :- male(X), married(X, Y).
wife(X, Y) :- female(X), married(Y, X).

child(bill_weasley, arthur_weasley).
child(louis_weasley, bill_weasley).
child(dominique_weasley, bill_weasley).
child(victoire_weasley, bill_weasley).
child(charlie_weasley, arthur_weasley).
child(percy_weasley, arthur_weasley).
child(molly_weasley_II, percy_weasley).
child(lucy_weasley, percy_weasley).
child(fred_weasley, arthur_weasley).
child(george_weasley, arthur_weasley).
child(fred_weasley_II, george_weasley).
child(roxanne_weasley, george_weasley).
child(ron_weasley, arthur_weasley).
child(hugo_weasley, ron_weasley).
child(rose_weasley, ron_weasley).
child(ginny_weasley, arthur_weasley).
child(james_potter, fleamont_potter).
child(harry_potter, james_potter).
child(dudley_dursley, vernon_dursley).
child(morfin_gaunt, marvolo_gaunt).
child(merope_gaunt, marvolo_gaunt).
child(tom_marvolo_riddle, tom_riddle_sr).
child(james_potter_II, harry_potter).
child(albus_severus_potter, harry_potter).
child(lily_potter_II, harry_potter).
child(walburga_black, pollux_black).
child(regulus_arcturus_black, orion_black).
child(sirius_black, orion_black).
child(alphard_black, pollux_black).
child(cygnus_black, pollux_black).
child(narcissa_black, cygnus_black).
child(scorpius_malfoy, draco_malfoy).
child(draco_malfoy, lucius_malfoy).
child(andromeda_black, cygnus_black).
child(nymphadora_tonks, ted_tonks).
child(bellatrix_black, cygnus_black).
child(teddy_lupin, remus_lupin).


parent(X, Y) :- child(Y, X).
parent(X, Y) :- married(Z, X), child(Y, Z).
father(X, Y) :- male(X), parent(X, Y).
mother(X, Y) :- female(X), parent(X, Y).
son(X, Y) :- male(X), parent(Y, X).
daughter(X, Y) :- female(X), parent(Y, X).
sibling(X, Y) :- child(X, Z), child(Y, Z), X\=Y.


brother(gideon_prewett, molly_prewett).
brother(fabian_prewett, molly_prewett).
brother(gideon_prewett, fabian_prewett).
brother(antioch_peverell, cadmus_peverell).
brother(cadmus_peverell, ignotus_peverell).
brother(ignotus_peverell, antioch_peverell).

brother(fabian_prewett, gideon_prewett).
brother(cadmus_peverell, antioch_peverell).
brother(ignotus_peverell, cadmus_peverell).
brother(antioch_peverell, ignotus_peverell).

brother(X, Y) :- male(X), sibling(X, Y).


brother(molly_prewett, gideon_prewett).
brother(molly_prewett, fabian_prewett).
sister(lily_evans, petunia_evans).

sister(petunia_evans, lily_evans).

sister(X, Y) :- female(X), sibling(X, Y).


uncle(sirius_black, harry_potter).
uncle(remus_lupin, harry_potter).
uncle(X, Y) :- brother(X, Z), parent(Z, Y).
uncle(X, Y) :- married(X, A), sister(A, Z), parent(Z, Y).
aunt(X, Y) :- sister(X, Z), parent(Z, Y).
aunt(X, Y) :- married(A, X), brother(A, Z), parent(Z, Y).
nephew(X, Y) :- male(X), uncle(Y, X).
nephew(X, Y) :- male(X), aunt(Y, X).
niece(X, Y) :- female(X), uncle(Y, X).
niece(X, Y) :- female(X), aunt(Y, X).
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).
grandfather(X, Y) :- male(X), grandparent(X, Y).
grandmother(X, Y) :- female(X), grandparent(X, Y).
grandchildren(X, Y) :- grandparent(Y, X).
grandson(X, Y) :- male(X), grandchildren(X, Y).
granddaughter(X, Y) :- female(X), grandchildren(X, Y).


ancestor(ignotus_peverell, james_potter).	
ancestor(cadmus_peverell, marvolo_gaunt).
ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(Z, Y), ancestor(X, Z).
descendent(X, Y) :- ancestor(Y, X).
