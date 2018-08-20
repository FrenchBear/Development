// Labyrinthe Java
// 2015-05-13   PV      Based on Python source

/*
+-+-+-+#+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|     |###|    ###|       |    ###|     |
+ +-+ + +#+-+-+#+#+-+-+-+ + +-+#+#+ +-+ +
| | |   |#######|###      |   |#|#| |   |
+ + +-+-+-+-+-+-+-+#+-+-+-+-+-+#+#+ + +-+
|       |          #|###########|#| | | |
+ +-+-+ +-+-+-+-+-+#+#+-+-+-+ +-+#+ + + +
| |     |   |     |#|#| |   |   |#  |   |
+ + +-+-+ + +-+ +-+#+#+ + + +-+ +#+-+-+-+
| |     | | |      ###  | |     |#|     |
+ +-+-+-+ + + + +-+-+-+ +-+-+-+-+#+ +-+ +
| |       | | |     | |     | |###| |   |
+ + +-+-+-+ + +-+-+ + +-+-+ + +#+-+-+ +-+
| |   | |   | |   |   |   | |###|   |   |
+ +-+ + + +-+ +-+ +-+-+ +-+ +#+-+ + +-+ +
|     |     |         |     |#    |     |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+#+-+-+-+-+-+
*/

import java.util.Random;

public class Labyrinthe {

    static int rows = 8;
    static int columns = 20;
    static Square[][] cells;
    static int remaining;
    static boolean finished;
    static Random rnd;

    public static void main(String[] args) {
        if (args.length == 2) {
            rows = Integer.parseInt(args[0]);
            columns = Integer.parseInt(args[1]);
            if (rows < 5 || rows > 200 || columns < 5 || columns > 200) {
                System.out
                        .println("Labyrinthe: rows and columns arguments must be in the range 5..200");
                return;
            }
        }

        if (args.length != 0 && args.length != 2) {
            System.out.println("Usage: java Labyrinthe.class rows columns");
            return;
        }

        // 2-dimension list of cells, walls everywhere and unvisited
        // row and column 0 are here only to represent top/left walls of
        // row/column 1
        cells = new Square[rows + 1][columns + 1];
        for (int r = 0; r <= rows; r++)
            for (int c = 0; c <= columns; c++)
                cells[r][c] = new Square();

        remaining = rows * columns;
        finished = false;

        rnd = new Random(123);

        // First cell, completely random
        int i = 1 + rnd.nextInt(rows);
        int j = 1 + rnd.nextInt(columns);
        dig(i, j);

        // Then continue digging starting with an explored cell until no
        // unexplored cell remains
        while (remaining > 0) {
            i = 1 + rnd.nextInt(rows);
            j = 1 + rnd.nextInt(columns);
            while (!cells[i][j].Visited) {
                i++;
                if (i > rows) {
                    i = 1;
                    j = (j % columns) + 1;
                }
            }
            dig(i, j);
        }

        // Finally chose a random entry and exit
        int cs = 1 + rnd.nextInt(columns); // Column start
        int ce = 1 + rnd.nextInt(columns); // Column exit
        cells[0][cs].Walls[0] = false;
        cells[rows][ce].Walls[0] = false;

        // Find a solution
        Solve(1, cs, rows, ce);

        // Print maze with solution
        PrintLabyrinth();
    }

    // Dig a gallery
    static void dig(int r, int c) {
        for (;;) {
            // First cell of a gallery is always visited, except the 1st cell of
            // the 1st gallery
            if (!cells[r][c].Visited) {
                cells[r][c].Visited = true;
                remaining -= 1;
            }

            // Chose a random direction: 0=right, 1=top, 2=left, 3=bottom
            int dir = rnd.nextInt(4);
            int nt = 1; // Number of tests
            int rn = 0, cn = 0, rt = 0, ct = 0; // Next row/col, Update row/col,
            int iw = 0; // Index of wall for cell update

            for (;;) {
                switch (dir) {
                case 0:
                    rn = r;
                    cn = c + 1;
                    rt = r;
                    ct = c;
                    iw = 1;
                    break;
                case 1:
                    rn = r - 1;
                    cn = c;
                    rt = r - 1;
                    ct = c;
                    iw = 0;
                    break;
                case 2:
                    rn = r;
                    cn = c - 1;
                    rt = r;
                    ct = c - 1;
                    iw = 1;
                    break;
                case 3:
                    rn = r + 1;
                    cn = c;
                    rt = r;
                    ct = c;
                    iw = 0;
                    break;
                }
                // Is next cell in the maze?
                if (rn >= 1 && rn <= rows && cn >= 1 && cn <= columns)
                    if (!cells[rn][cn].Visited)
                        break; // Ok, cell is accepted

                // Not Ok, we turn direction 90 degrees
                dir = (dir + 1) % 4;
                nt++;
                if (nt == 5)
                    return; // All directions explored, no adjacent cell
                            // unexplored
            }

            // Erase the border
            cells[rt][ct].Walls[iw] = false;

            // Move to next cell
            r = rn;
            c = cn;
        }
    }

    // Simple text printing of the labyrinth
    static void PrintLabyrinth() {
        String path_dot = "#";

        for (int rl = 0; rl <= rows; rl++) {
            // 1st line, cell interior and right wall, not on row 0
            if (rl > 0) {
                for (int cl = 0; cl <= columns; cl++) {
                    Square col = cells[rl][cl];
                    // Cell interior, not on column 0
                    if (cl > 0)
                        System.out.print(col.DirSol == 6 ? path_dot : ' ');
                    // Right wall
                    if (col.Walls[1] || cl == columns)
                        System.out.print('|');
                    else
                        System.out.print(col.DirSol == 6
                                && cells[rl][cl + 1].DirSol == 6 ? path_dot
                                : ' ');
                }
                System.out.println();
            }
            // 2nd line, bottom wall
            for (int cl = 0; cl < columns + 1; cl++) {
                Square col = cells[rl][cl];
                // Bottom wall, not on column 0
                if (cl > 0)
                    if (col.Walls[0] || rl == rows || rl == 0)
                        System.out.print(col.Walls[0] ? "-" : path_dot);
                    else
                        System.out.print(col.DirSol == 6
                                && cells[rl + 1][cl].DirSol == 6 ? path_dot
                                : ' ');
                // Bottom right corner, always a +
                System.out.print('+');
            }
            System.out.println();
        }
    }

    // Labyrinth solver
    static void Solve(int rs, int cs, int re, int ce) {
        cells[re][ce].DirSol = 6; // Mark end cell as part of solution
        Search(rs, cs);

        // Mark all cells in current path as being part of the solution
        for (int r = 0; r <= rows; r++)
            for (int c = 0; c <= columns; c++)
                if (cells[r][c].DirSol >= 1 && cells[r][c].DirSol <= 4)
                    cells[r][c].DirSol = 6;
    }

    static void Search(int r, int c) {
        for (int dir = 0; dir < 4; dir++) {
            cells[r][c].DirSol = dir + 1;
            // Next row/col, Update row/col, index of wall for cell update
            int rn = 0;
            int cn = 0;
            int rt = 0;
            int ct = 0;
            int iw = 0;
            switch (dir) {
            case 0:
                rn = r;
                cn = c + 1;
                rt = r;
                ct = c;
                iw = 1;
                break;
            case 1:
                rn = r - 1;
                cn = c;
                rt = r - 1;
                ct = c;
                iw = 0;
                break;
            case 2:
                rn = r;
                cn = c - 1;
                rt = r;
                ct = c - 1;
                iw = 1;
                break;
            case 3:
                rn = r + 1;
                cn = c;
                rt = r;
                ct = c;
                iw = 0;
                break;
            }
            // If next cell in the maze
            if (rn >= 1 && rn <= rows && cn >= 1 && cn <= columns) {
                // No wall?
                if (!cells[rt][ct].Walls[iw]) {
                    if (cells[rn][cn].DirSol == 6) // Found exit cell
                    {
                        finished = true;
                        return;
                    }
                    if (cells[rn][cn].DirSol == 0) {
                        Search(rn, cn);
                        if (finished)
                            return;
                    }
                }
            }
        }
        cells[r][c].DirSol = 5; // Not part of solution
    }

}
