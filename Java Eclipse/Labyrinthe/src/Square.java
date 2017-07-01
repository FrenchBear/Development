// A simple class to represent a cell in the maze
// Actually just a data structure
// Initialized walled, unvisited (generation), unexplored (solution)
// 2015-05-13   PV

public class Square {
    // ToDo: How to initialize a constant array in Java?
    public boolean Walls[] = new boolean[2];    // index 0=bottom, 1=right 
    public boolean Visited = false;             // for generation
    public int DirSol = 0;                      // direction of solution
    
    Square()
    {
        Walls[0] = true;
        Walls[1] = true;
    }
}
