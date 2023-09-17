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

% Authors
author(paul_erdos).
author(stephen_king).
author(william_shakespear).
author(leo_tolstoy).
author(yuri_slezkine).
author(john_paul).
author(joan_paul).
author(james_paul).
author(lebron_james).
author(ben_simmons).

author(tina).
author(jennifer).
author(tom).

publication(article1, tom).
publication(article1, jennifer).

publication(article2, jennifer).
publication(article2, tina).

% Publications
publication(on_sets_of_distances_of_n_points).
publication(machine_learning_for_beginners).
publication(cybersecurity_best_practices).
publication(data_structures_in_c).
publication(advanced_python_programming).

%%%%% SECTION: articleAuthor
% Put your atomic statements for the articleAuthor predicate in this section

articleAuthor(on_sets_of_distances_of_n_points, paul_erdos).
articleAuthor(machine_learning_for_beginners, lebron_james).
articleAuthor(cybersecurity_best_practices, stephen_king).
articleAuthor(data_structures_in_c, leo_tolstoy).
articleAuthor(data_structures_in_c, stephen_king).
articleAuthor(data_structures_in_c, william_shakespear).
articleAuthor(advanced_python_programming, william_shakespear).
articleAuthor(advanced_python_programming, lebron_james).


%%%%% SECTION: articleTopic
% Put your atomic statements for the articleTopic predicate in this section

articleTopic(on_sets_of_distances_of_n_points, programming).
articleTopic(machine_learning_for_beginners, artificial_intelligence).
articleTopic(cybersecurity_best_practices, cybersecurity).
articleTopic(data_structures_in_c, programming).
articleTopic(advanced_python_programming, programming).

%%%%% SECTION: collabDist
% Put your rules for collabDist in this section

% Predicate to find all authors of an article who are not equal to Author1

% Base case: Author is the same as Other Author
collabDist(Author, Author, MaxDist) :-
	Author = Author,
	MaxDist >= 0.

% Check if Author1 and Author2 worked on the same article
collabDist(Author1, Author2, MaxDist) :-
    	MaxDist > 0,
    	articleAuthor(Article, Author1),  % Author1 is an author of Article
    	articleAuthor(Article, Author2).  % Author2 is also an author of Article

% Check each author of article, until the author is author2
collabDist(Author1, Author2, MaxDist) :-
    	MaxDist > 0,
    	articleAuthor(Article, Author1),
    	articleAuthor(Article, OtherAuthor),  % Check if any other author wrote the article
    	Author1 \= Author2,  % Make sure the other author isn't the same author (no other collaborator) 
    	MaxDist1 is MaxDist - 1,  % Reduce MaxDist by 1
    	collabDist(OtherAuthor, Author2, MaxDist1).  % Recursively check with reduced MaxDist
	

%%%% SECTION: collabDistWithAI
% Put your rules for collabDistWithAI in this section

collabDist(Author, Author, MaxDist, none) :-
	Author = Author,
	articleAuthor(Article, Author),
	not articleTopic(Article, artificial_intelligence),
	MaxDist >= 0.

collabDist(Author, Author, MaxDist, at_least_one) :-
	Author = Author,
	articleAuthor(Article, Author),
	articleTopic(Article, artificial_intelligence),
	MaxDist >= 0.

collabDistWithAI(Author1, Author2, MaxDist, AI) :-
    	MaxDist > 0,
    	articleAuthor(Article, Author1),
    	articleAuthor(Article, Author2),
    	AI = none,
    	not articleTopic(Article, artificial_intelligence).

collabDistWithAI(Author1, Author2, MaxDist, AI) :-
    	MaxDist > 0,
    	articleAuthor(Article, Author1),
    	articleAuthor(Article, Author2),
    	AI = at_least_one,
    	articleTopic(Article, artificial_intelligence).

collabDistWithAI(Author1, Author2, MaxDist, AI) :-
    	MaxDist > 0,
    	articleAuthor(Article, Author1),
    	articleAuthor(Article, OtherAuthor),
    	Author1 \= Author2,
    	MaxDist1 is MaxDist - 1,
    	collabDistWithAI(OtherAuthor, Author2, MaxDist1, AI).
