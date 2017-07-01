using System;
using System.Collections.Generic;
using System.Text;

namespace SampleSolver
{
      
    public class SampleSolver : SudokuFX.ISudokuSolver  
    { 
        
        public string Name
        {
            get
            {
                return "Sample Sudoku Solver";
            }
        }

        public string Description
        {
            get
            {
                return "This is a sample algorithm that uses a combination of logic and guess-and-check.";
            }
        }

        public string Author
        {
            get 
            {
                return "Lucas Magder";
            }
        }
        bool Validate(List<int>[,] board)
        {
            int size = board.GetLength(0);
            int blocksize = (int)Math.Sqrt(size);
            for (int r = 0; r < size; r++)
            {
                bool[] used = new bool[size]; 
                for (int c = 0; c < size; c++)
                {
                    if (used[board[r, c][0] - 1])
                    {
                        return false;
                    }
                    else
                    {
                        used[board[r, c][0] - 1] = true;
                    }
                }
            }
            for (int c = 0; c < size; c++)
            {
                bool[] used = new bool[size];
                for (int r = 0; r < size; r++)
                {
                    if (used[board[r, c][0] - 1])
                    {
                        return false;
                    }
                    else
                    {
                        used[board[r, c][0] - 1] = true;
                    }
                }
            }
            for (int r = 0; r < size - blocksize; r += blocksize)
            {
                for (int c = 0; c < size - blocksize; c += blocksize)
                {
                    bool[] used = new bool[size];
                    for (int br = 0; br < blocksize; br++)
                    {
                        for (int bc = 0; bc < blocksize; bc++)
                        {
                            if (used[board[br+r, bc+c][0] - 1])
                            {
                                return false;
                            }
                            else
                            {
                                used[board[br+r, bc+c][0] - 1] = true;
                            }
                        }
                    }
                }
            }
            return true;
        }
        List<int>[,] DeepCopy(List<int>[,] board)
        {
            List<int>[,] n = board.Clone() as List<int>[,];
            for (int a = 0; a < n.GetLength(0); a++)
            {
                for (int b = 0; b < n.GetLength(1); b++)
                {
                    n[a, b] = new List<int>(n[a, b]);
                }
            }
            return n;
        }
       
        bool RecursiveSolve(ref List<int>[,] board)
        {
                int size = board.GetLength(0);
                int blocksize = (int)Math.Sqrt(size);
                bool changeMade = false;
                do
                {
                    changeMade = false;
                    //rows
                    for (int r = 0; r < size; r++)
                    {
                        List<int> toRemove = new List<int>();
                        for (int c = 0; c < size; c++)
                        {
                            if (board[r, c].Count == 1) toRemove.Add(board[r, c][0]);
                        }
                        for (int c = 0; c < size; c++)
                        {
                            if (board[r, c].Count > 1)
                            {
                                foreach (int i in toRemove)
                                {
                                    if (board[r, c].Remove(i))
                                        changeMade = true;
                                }
                                //if (board[r, c].Count == 1)
                                 //   System.Diagnostics.Debug.WriteLine("Set: " + board[r, c][0] + " [" + r + ", " + c + "]");

                            }
                        }
                    }
                    //cols
                    for (int c = 0; c < size; c++)
                    {
                        List<int> toRemove = new List<int>();
                        for (int r = 0; r < size; r++)
                        {
                            if (board[r, c].Count == 1) toRemove.Add(board[r, c][0]);
                        }
                        for (int r = 0; r < size; r++)
                        {
                            if (board[r, c].Count > 1)
                            {
                                foreach (int i in toRemove)
                                {
                                    if (board[r, c].Remove(i))
                                        changeMade = true;
                                }
                               // if (board[r, c].Count == 1)
                                //    System.Diagnostics.Debug.WriteLine("Set: " + board[r, c][0] + " [" + r + ", " + c + "]");

                            }
                        }
                    }
                    for (int r = 0; r < size - blocksize; r += blocksize)
                    {

                        for (int c = 0; c < size - blocksize; c += blocksize)
                        {
                            List<int> toRemove = new List<int>();
                            for (int br = 0; br < blocksize; br++)
                            {
                                for (int bc = 0; bc < blocksize; bc++)
                                {
                                    if (board[r + br, c + bc].Count == 1) toRemove.Add(board[r + br, c + bc][0]);
                                }
                            }
                            for (int br = 0; br < blocksize; br++)
                            {
                                for (int bc = 0; bc < blocksize; bc++)
                                {
                                    if (board[r + br, c + bc].Count > 1)
                                    {
                                        foreach (int i in toRemove)
                                        {
                                            if (board[r + br, c + bc].Remove(i))
                                                changeMade = true;
                                        }
                                        //if (board[r + br, c + bc].Count == 1)
                                         //   System.Diagnostics.Debug.WriteLine("Set: " + board[r + br, c + bc][0] + " [" + (r + br) + ", " + (c + bc) + "]");
                                    }
                                }
                            }
                        }
                    }
                }
                while (changeMade);
                int minr = 0, minc = 0;
                int min = size;
                for (int r = 0; r < size; r++)
                {
                    for (int c = 0; c < size; c++)
                    {
                        if (board[r, c].Count == 0)
                        {
                            return false;
                        }
                        else if (board[r, c].Count > 1 && board[r, c].Count < size)
                        {
                            minr = r;
                            minc = c;
                            size = board[r, c].Count;
                        }
                    }
                }
                //if (guessCount > 1) return true;
                if (board[minr, minc].Count == 1) //board is full
                {
                    return Validate(board);
                }
                Random rnd = new Random();
                List<int> cell = board[minr,minc]; 
                int baseidx = rnd.Next(cell.Count);
                
                for(int i = 0; i < cell.Count; i++)
                {
                    List<int>[,] c = DeepCopy(board);
                    c[minr, minc].Clear();
                    c[minr, minc].Add(cell[baseidx]);

                    //System.Diagnostics.Debug.WriteLine("Guess: " + i + " [" + minr + ", " + minc + "]");
                    if (RecursiveSolve(ref c))
                    {
                        board = c;
                        return true;
                    }
                    /*
                    else
                    {
                        System.Diagnostics.Debug.WriteLine("Failed Guess: " + i + " [" + minr + ", " + minc + "]");
                    }
                     */

                    baseidx++;
                    if (baseidx == cell.Count) baseidx = 0;
                }
                return false;
           
        }
        
        public bool Solve(ref int?[,] board)
        {
            System.Diagnostics.Debug.WriteLine("Begin");   
            List<int>[,] b = new List<int>[board.GetLength(0),board.GetLength(1)];
            for (int r = 0; r < board.GetLength(0); r++)
            {
                for (int c = 0; c < board.GetLength(1); c++)
                {
                    b[r, c] = new List<int>();
                    if (board[r,c].HasValue)
                    {
                        b[r, c].Add(Math.Abs(board[r,c].Value));
                    }
                    else
                    {
                        for (int i = 1; i <= board.GetLength(0); i++)
                        {
                            b[r, c].Add(i);
                        }
                    }
                }
            }
            bool ret = RecursiveSolve(ref b);
            if (ret)
            {
                for (int r = 0; r < board.GetLength(0); r++)
                {
                    for (int c = 0; c < board.GetLength(1); c++)
                    {
                        if (!board[r,c].HasValue || board[r,c].Value > 0) 
                            board[r, c] = b[r, c][0];
                    }
                }
            }
            if (!ret) System.Diagnostics.Debug.WriteLine("Fail");   
            System.Diagnostics.Debug.WriteLine("End");   
            return ret;
            
        }
    }
    public class OtherSolver : SudokuFX.ISudokuSolver
    {
        public string Name
        {
            get
            {
                return "Other Sudoku Solver";
            }
        }

        public string Description
        {
            get
            {
                return "This is a dummy plug-in";
            }
        }

        public string Author
        {
            get
            {
                return "Lucas Magder";
            }
        }

        public bool Solve(ref int?[,] board)
        {
            System.Threading.Thread.Sleep(750);
            return false;
        }
    }

}
