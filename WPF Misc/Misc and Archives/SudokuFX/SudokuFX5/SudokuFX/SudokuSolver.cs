using System;
using System.Collections.Generic;
using System.Text;
using System.Reflection;
using System.Runtime.Remoting;
using System.Security;
using System.Security.Policy;
using System.Security.Permissions;
using System.Windows;

namespace SudokuFX
{
    public class SudokuSolverContainer : MarshalByRefObject, ISudokuSolver
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

    public class SolverResult : DependencyObject
    {
        TimeSpan timeTaken;
        public TimeSpan TimeTaken
        {
            get
            {
                return timeTaken;
            }
            set
            {
                timeTaken = value;
            }
        }
        ISudokuSolver solver;
        public ISudokuSolver Solver
        {
            get
            {
                return solver;
            }
            set
            {
                solver = value;
            }
        }
        bool failed;
        public bool Failed
        {
            get
            {
                return failed;
            }
            set
            {
                failed = value;
            }
        }
    }

}
