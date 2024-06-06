% Set the size of the grid
gridSize = 50;

% Initialize the grid with random values
grid = randi([0, 1], gridSize);

% Create a figure window
figure;

% Run the game for a certain number of iterations
numIterations = 1;
for iteration = 1:numIterations
    % Display the current grid
    imagesc(grid);
    colormap(gray);
    axis off;
    title(['Iteration: ' num2str(iteration)]);
    drawnow;

    % Apply the rules of the Game of Life to update the grid
    newGrid = grid;
    for i = 1:gridSize
        for j = 1:gridSize
            % Count the number of live neighbors
            liveNeighbors = sum(sum(grid(max(1, i-1):min(gridSize, i+1), max(1, j-1):min(gridSize, j+1)))) - grid(i, j);

            % Apply the rules of the Game of Life
            if grid(i, j) == 1 && (liveNeighbors < 2 || liveNeighbors > 3)
                newGrid(i, j) = 0; % Cell dies
            elseif grid(i, j) == 0 && liveNeighbors == 3
                newGrid(i, j) = 1; % Cell is born
            end
        end
    end

    % Update the grid
    grid = newGrid;
end