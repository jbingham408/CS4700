%-----------------------------------------------------------------------
% The try predicate tries to move down, then left
% if down fails, then right if left fails, etc.
% By reordering the rules, the direction of the
% search in the maze can be changed.
%-----------------------------------------------------------------------
% Down
try(Row, Col, ToRow, Col) :- ToRow is Row + 1.
% Left
try(Row, Col, Row, ToCol) :- ToCol is Col + 1.
% Right
try(Row, Col, Row, ToCol) :- ToCol is Col - 1.
% Up
try(Row, Col, ToRow, Col) :- ToRow is Row - 1.

%-----------------------------------------------------------------------
% The memberOf(X, L) predicate suceeds if X is a member of list L.
%-----------------------------------------------------------------------
memberOf(H, [H|_]). 
memberOf(H, [X|T]) :- X \== H, memberOf(H, T).

%-----------------------------------------------------------------------
% The visit(X, L, NL) predicate suceeds if X is not a member of List L,
% and adds X to list L creating list NL.  If X is already in the list L
% it fails.
%-----------------------------------------------------------------------
visit(H, [], [H]). 
visit(X, [H|T], [H|NL]) :- X \== H, visit(X, T, NL).

%-----------------------------------------------------------------------
% The printCell(Maze, List, Row, Col) predicate prints an individual cell 
% in the maze, if Row, Col is a
%   - barrier then print an x
%   - a corner then print a +
%   - a top or bottom boundary then print a -
%   - a side boundary then print a |
%   - in the list of visited celss, then print a *
%   - by default print a blank
%-----------------------------------------------------------------------
% Print a barrier if it is there.
printCell(Maze, _, Row, Col) :- maze(Maze, Row, Col, barrier), write('x').
% Upper left corner
printCell(_, _, 0, 0) :- write('+').
% Upper right corner
printCell(Maze, _, Row, 0) :- mazeBoundary(Maze, Row, _), write('+').
% Lower left corner
printCell(Maze, _, 0, Col) :- mazeBoundary(Maze, _, Col), write('+').
% Lower right corner
printCell(Maze, _, Row, Col) :- mazeBoundary(Maze, Row, Col), write('+').
% Right boundary
printCell(_, _, 0, _) :- write('-').
% Left boundary
printCell(Maze, _, Row, _) :- mazeBoundary(Maze, Row, _), write('-').
% Top boundary
printCell(_, _, _, 0) :- write('|').
% Bottom boundary
printCell(Maze, _, _, Col) :- mazeBoundary(Maze, _, Col), write('|').
% Member of the list
printCell(_, L, Row, Col) :- memberOf([Row,Col], L), write('*').
% Default
printCell(_, _, _, _) :- write(' ').

% You write these, add helper predicates as needed...
printList(List) :- fail.
printMaze(Maze,List) :- fail.
solve(Maze) :- fail.
