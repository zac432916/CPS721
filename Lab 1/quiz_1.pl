child(john, paul).
child(john, ann).
child(mary, ann).
child(mary, paul).
child(ann, wendy).
child(ann, chris).

male(john).
male(paul).
male(chris).

female(mary).
female(ann).

mother(X, Y) :- child(Y, X), female(X).
