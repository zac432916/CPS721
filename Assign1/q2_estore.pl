% Enter the names of your group members below.
% If you only have 2 group members, leave the last space blank
%
%%%%%
%%%%% NAME: 
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
numPurchased(laptop, 72).
numPurchased(keyboard, 80).
numPurchased(monitor, 33).

%%%%% SECTION: shippingCost
% Put your atomic statements for the shippingCost predicate in this section
shippingCost(laptop, 7).
shippingCost(keyboard, 10).
shippingCost(monitor, 10).

%%%% SECTION: taxRate
% Put your atomic statements for the taxRate predicate in this section
taxRate(0.13).

%%%%% SECTION: freeRegularShippingMin
% Put your atomic statements for the freeRegularShippingMin predicate in this section
freeRegularShippingMin(35).

%%%%% SECTION: freeExpressShippingMin
% Put your atomic statements for the freeExpressShippingMin predicate in this section
freeExpressShippingMin(200).

%%%%% SECTION: subtotal
% Put your rules for the subtotal predicate in this section
subtotal(Sub) :-  cost(laptop, LaptopCost), numPurchased(laptop, LaptopAmount), cost(keyboard, KeyboardCost),
numPurchased(keyboard, KeyboardAmount), cost(monitor, MonitorCost), numPurchased(monitor, MonitorAmount), 
Sub is ((LaptopCost * LaptopAmount) + (KeyboardCost * KeyboardAmount) + (MonitorCost * MonitorAmount)).

%%%%% SECTION: calculateBaseShipping
% Put your rules for the calculateBaseShipping predicate in this section


%%%%% SECTION: calculateShipping
% Put your rules for the calculateShipping predicate in this section


%%%%% SECTION: totalCost
% Put your rules for the totalCost predicate in this section


