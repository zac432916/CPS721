% Enter the names of your group members below.
% If you only have 2 group members, leave the last space blank
%
%%%%%
%%%%% NAME: Humza Khan (501110642)
%%%%% NAME:
%%%%% NAME:
%
% Add the required rules in the corresponding sections. 
% If you put the rules in the wrong sections, you will lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY the comment lines below
%

%%%%% SECTION: cost
% Put your atomic statements for the cost in this section
cost(laptop, 600).
cost(keyboard, 25).
cost(monitor, 180).

%%%%% SECTION: numPurchased
% Put your atomic statements for the numPurchased predicate in this section
numPurchased(laptop, 5).
numPurchased(keyboard, 2).
numPurchased(monitor, 5).

%%%%% SECTION: shippingCost
% Put your atomic statements for the shippingCost predicate in this section
shippingCost(laptop, 20).
shippingCost(keyboard, 10).
shippingCost(monitor, 10).

%%%% SECTION: taxRate
% Put your atomic statements for the taxRate predicate in this section
taxRate(0.13).

%%%%% SECTION: freeRegularShippingMin
% Put your atomic statements for the freeRegularShippingMin predicate in this section
freeRegularShippingMin(3000).

%%%%% SECTION: freeExpressShippingMin
% Put your atomic statements for the freeExpressShippingMin predicate in this section
freeExpressShippingMin(5000).

%%%%% SECTION: subtotal
% Put your rules for the subtotal predicate in this section
subtotal(Sub) :-  cost(laptop, LaptopCost), numPurchased(laptop, LaptopAmount), cost(keyboard, KeyboardCost),
numPurchased(keyboard, KeyboardAmount), cost(monitor, MonitorCost), numPurchased(monitor, MonitorAmount), 
Sub is ((LaptopCost * LaptopAmount) + (KeyboardCost * KeyboardAmount) + (MonitorCost * MonitorAmount)).

%%%%% SECTION: calculateBaseShipping
% Put your rules for the calculateBaseShipping predicate in this section
calculateBaseShipping(ShippingCost) :- shippingCost(laptop, LaptopCost), numPurchased(laptop, LaptopAmount), shippingCost(keyboard, KeyboardCost),
numPurchased(keyboard, KeyboardAmount), shippingCost(monitor, MonitorCost), numPurchased(monitor, MonitorAmount), 
ShippingCost is ((LaptopCost * LaptopAmount) + (KeyboardCost * KeyboardAmount) + (MonitorCost * MonitorAmount)).

%%%%% SECTION: calculateShipping
% Put your rules for the calculateShipping predicate in this section
calculateShipping(regular, ShippingCost) :- calculateBaseShipping(X), ShippingCost is X.
calculateShipping(express, ShippingCost) :- calculateBaseShipping(X), ShippingCost is (X * 1.5).

%%%%% SECTION: totalCost
% Put your rules for the totalCost predicate in this section
totalCost(regular, Cost) :- subtotal(Sub), freeRegularShippingMin(Minimum), Sub >= Minimum -> totalCost(regular, Cost, free); totalCost(regular, Cost, notFree).
totalCost(express, Cost) :- subtotal(Sub), freeExpressShippingMin(Minimum), Sub >= Minimum -> totalCost(express, Cost, free); totalCost(express, Cost, notFree).
totalCost(_, Cost, free) :- taxRate(Tax), subtotal(Sub), Cost is Sub * (Tax + 1).
totalCost(regular, Cost, notFree) :- taxRate(Tax), subtotal(Sub), calculateShipping(regular, ShippingCost), Cost is (ShippingCost + Sub) * (Tax + 1).
totalCost(express, Cost, notFree) :- taxRate(Tax), subtotal(Sub), calculateShipping(express, ShippingCost), Cost is (ShippingCost + Sub) * (Tax + 1).
