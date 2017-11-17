% Load the maze.pl file
?- consult(maze).
% Load the solve.pl file
%?- consult(solve).
?- consult(solution).

% Should print a '+'
?- printCell(small, [], 0, 0).

% Should print the small maze
?- printMaze([], small).

% Solve the small maze
?- solve(small).
