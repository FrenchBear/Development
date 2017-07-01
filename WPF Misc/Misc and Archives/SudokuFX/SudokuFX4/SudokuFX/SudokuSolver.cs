using System;
using System.Collections.Generic;
using System.Text;
using System.Reflection;
using System.Runtime.Remoting;
using System.Security;
using System.Security.Policy;
using System.Security.Permissions;  

namespace SudokuFX
{
    public class SudokuSolverContainer: MarshalByRefObject,ISudokuSolver 
    {
        ISudokuSolver solver;
        public void Init(Type t)
        {
            solver = Activator.CreateInstance(t) as ISudokuSolver;
        }
        public string Name
        {
            get { return solver.Name; }
        }

        public string Description
        {
            get { return solver.Description; }
        }

        public string Author
        {
            get { return solver.Author; }
        }

        public bool Solve(ref int?[,] board)
        {
            return solver.Solve(ref board);
        }

    }
    public interface ISudokuSolver
    {
        string Name
        {
            get;
        }
        string Description
        {
            get;
        }
        string Author
        {
            get;
        }
        bool Solve(ref int?[,] board);
    }

}
