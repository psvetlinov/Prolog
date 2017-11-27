%sum list
elem_sum([],0).
elem_sum([H|T],S):-elem_sum(T,X),S is H+X.

%list_length
llength([],0).
llength([_|T],X):-length(T,X1), X is X1+1.

%reverse_list
r(S,[],S).
r(S,[H|T],R):-r([H|S],T,R).

reverse(L,R):-r([],L,R).

%is_list_palindrome
is_palindrome(L):-reverse(L,L).

%duplicate_elements_of_list
dupli([],[]).
dupli([H|T],[H,H|Y]):-dupli(T,Y).

%duplicate_elements_of_list_k_times
duplik(L1,N,L2):-dupli_help(L1,N,L2,N).

dupli_help([],_,[],_).
dupli_help([_|T],N,L2,0):-dupli_help(T,N,L2,N).
dupli_help([H|T1],N,[H|T2],K):-K>0, K1 is K-1, dupli_help([H|T1],N,T2,K1).

%split_list\split(L,N,L1,L2).
split(L,0,[],L).
split([H|T1],N,[H|T2],L2):-N>0, N1 is N-1, split(T1,N1,T2,L2).

%remove_duplicates\compress(L,LC).
compress([],[]).
compress([X],[X]).
compress([H,H|T],LC):-compress([H|T],LC).
compress([H,Y|Y1],[H|T1]):-H\=Y, compress([Y|Y1],T1).

%make_groups_of_elements-> group(L,G).
group([],[]).
group([X],[[X]]).
group([H|[H|T]],[[H|H1]|GT]):-group([H|T],[H1|GT]).
group([X|[H|T]],[[X]|GT]):-X\=H,group([H|T],GT).


%histogram_of_list
histogram(L1,HI):-group(L1,G),transform(G,HI).

transform([],[]).
transform([[H|T]|GT],[[N,H]|HIT]):-length([H|T], N), transform(GT,HIT).

%non_duplicate_elements_in_list_along_histogram
histmodify(L1,HM):-histogram(L1,HI),strip(HI,HM).

strip([],[]).
strip([[1,H]|T],[H|RT]):-strip(T,RT).
strip([[N,H]|T],[[N,H]|RT]):-N>1,strip(T,RT).

%is_element_member_of_list
member(X,[X|_]).
member(X,[_|T]):-member(X,T).

%natural_numbers_generator_of_N_pairs
n(0,[],0).
n(N,[H|T],S):-N>0, between(0,S,H), S1 is S-H,N1 is N-1, n(N1,T,S1).

%pairs_of_natural_numbers_generator
n(N,L):-n(S),n(N,L,S).

%natural_numbers_generator
n(0).
n(X):-n(Y), X is Y+1.

%remove_element_X_from_list
remove(X,[X|L],L).
remove(X,[H|L],[H|N]):-remove(X,L,N).

%all_permutations_of_list
perm([],[]).
perm([X|P],L):-perm(P,N), remove(X,L,N).

%get_last_element_of_list
lastt([H],H).
lastt([_|T],X):-lastt(T,X).

last([],[]).
last([H|T],[X|T1]):-lastt(H,X),last(T,T1).

%get_second_element_of_list
second([],[]).
second([[_]|T],T1):-second(T,T1).
second([[_,H2|_]|T1],[H2|T]):- second(T1,T).

%sum list
elem_sum([],0).
elem_sum([H|T],S):-elem_sum(T,X),S is H+X.
