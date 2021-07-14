// PVScheduler.cs
// My own implementation of a thread scheduler
// 2016-08-07   Move code in a dedicated class

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DIF
{
    public class PVScheduler<T>
    {
        // Multitasking
        private readonly int _MAX_PARALLISM;

        // List of tasks running in parallel
        private readonly List<Task<T>> lt = new List<Task<T>>();

        // Actions to execute when task is done
        private readonly Dictionary<Task<T>, Action<T>> wd = new Dictionary<Task<T>, Action<T>>();

        // Number of active hashing tasks
        private int n = 0; 

        public PVScheduler()
        {
            // Initialization for multitasking (Max number of // tasks)
            if (Environment.ProcessorCount > 4)
                _MAX_PARALLISM = Environment.ProcessorCount - 2;
            else if (Environment.ProcessorCount > 2)
                _MAX_PARALLISM = Environment.ProcessorCount - 1;
            else
                _MAX_PARALLISM = Environment.ProcessorCount;
            if (_MAX_PARALLISM < 1) _MAX_PARALLISM = 1;

            // For debugging in Visual Studio
            //_MAX_PARALLISM = 1;
        }

        public int MAX_PARALLISM
        {
            get
            {
                return _MAX_PARALLISM;
            }
        }

        public void RunTask(Func<T> a, Action<T> WhenDone)
        {
            Task<T> ta = Task.Run<T>(a);
            lock (lt)
            {
                lt.Add(ta);
                wd.Add(ta, WhenDone);
            }

            n++;
            if (n == _MAX_PARALLISM)
            {
                Task.WaitAny(lt.ToArray());
                lock (lt)
                {
                    var lf = new List<Task<T>>();
                    foreach (var t in lt)
                        if (t.IsCompleted)
                        {
                            lf.Add(t);
                            wd[t](t.Result);
                            n--;
                        }
                    foreach (var t in lf)
                    {
                        lt.Remove(t);
                        wd.Remove(t);
                    }
                }

            }
        }

        public void WaitAll()
        {
            // Wail all tasks to terminate
            while (n > 0)
            {
                //if (cancelToken.IsCancellationRequested) goto ExitHash;

                //await Task.WhenAny(lt.ToArray());
                Task.WaitAny(lt.ToArray());
                lock (lt)
                {
                    var lf = new List<Task<T>>();
                    foreach (var t in lt)
                        if (t.IsCompleted)
                        {
                            lf.Add(t);
                            wd[t](t.Result);
                            n--;
                        }
                    foreach (var t in lf)
                    {
                        lt.Remove(t);
                        wd.Remove(t);
                    }
                }
            }

        }
    }
}
