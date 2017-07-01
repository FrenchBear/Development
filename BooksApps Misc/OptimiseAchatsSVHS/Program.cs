// OptimiseSVHS
// Optimisation d'achat des Science & Vie Hors Série
// 2016-04-11   PV

using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Console;

namespace OptimiseSVHS
{
    class Program
    {
        struct issueSeller
        {
            public int issue;
            public string seller;
        }

        static List<int> issueList = new List<int>();

        static Dictionary<int, List<string>> dicSellersList = new Dictionary<int, List<string>>();
        static Dictionary<string, List<int>> dicIssuesList = new Dictionary<string, List<int>>();
        static Dictionary<string, double> dicPriceIssue = new Dictionary<string, double>();
        static Dictionary<string, double> dicPriceShipment = new Dictionary<string, double>();


        static void Main(string[] args)
        {
            InitializeData();

            //issueList = new List<int> { 127, 129, 156, 158, 165, 167, 168, 171, 172, 173, 174, 175, 179, 180, /* 205,  206,  207, 209*/ };
            issueList = new List<int> { 127, 129, 156, 168, 171, 174, 179, 180, 205, 206, 207, 209 };

            Stopwatch sw = Stopwatch.StartNew();
            int nsol = 0;
            double minSolutionPrice = 1000.0;
            List<issueSeller> bestSolution = null;

            foreach (List<issueSeller> solution in StackSolver(issueList))
            {
                double totalSolutionPrice = 0.0;
                var dicSellersCount = new Dictionary<string, int>();
                var dicSellersMaxShipment = new Dictionary<string, double>();
                foreach (issueSeller item in solution)
                {
                    //Write("{0}:{1} ", item.issue, item.seller);

                    string key = item.issue.ToString() + item.seller;
                    totalSolutionPrice += dicPriceIssue[key];
                    if (!dicSellersCount.ContainsKey(item.seller))
                    {
                        dicSellersCount.Add(item.seller, 1);
                        dicSellersMaxShipment.Add(item.seller, dicPriceShipment[key]);
                    }
                    else
                    {
                        dicSellersCount[item.seller]++;
                        if (dicPriceShipment[key] > dicSellersMaxShipment[item.seller])
                            dicSellersMaxShipment[item.seller] = dicPriceShipment[key];
                    }
                }
                foreach (string seller in dicSellersCount.Keys)
                    totalSolutionPrice += dicSellersMaxShipment[seller] + (dicSellersCount[seller] - 1) * 1.1;
                //WriteLine("-> {0}", totalSolutionPrice);

                if (totalSolutionPrice < minSolutionPrice)
                {
                    minSolutionPrice = totalSolutionPrice;
                    bestSolution = solution;
                }

                nsol++;
                if (nsol % 1000000 == 0) WriteLine($"{nsol}\t{sw.Elapsed}");
            }

            WriteLine();
            WriteLine($"{nsol} solutions found in {sw.Elapsed}");
            foreach (issueSeller item in bestSolution)
                Write("{0}:{1} ", item.issue, item.seller);
            WriteLine("-> {0}", minSolutionPrice);

            Console.WriteLine();
            Console.Write("(Pause)");
            Console.ReadLine();
        }

        static IEnumerable<List<issueSeller>> Solver(List<int> issueList)
        {
            // Take first issue of the list
            int issue = issueList[0];

            // If list contains one element, solutions are trivial
            if (issueList.Count == 1)
            {
                foreach (string seller in dicSellersList[issue])
                {
                    yield return new List<issueSeller> { new issueSeller { issue = issue, seller = seller } };
                }
            }
            else
            {
                // Look for all sellers
                foreach (string seller in dicSellersList[issue])
                {
                    List<issueSeller> solution = new List<issueSeller>();
                    List<int> remainingIssueList = new List<int>(issueList);

                    //foreach (int i2 in issueList.Intersect(dicIssuesList[seller]))
                    foreach (int i2 in issueList)
                        if (dicIssuesList[seller].Contains(i2))
                        {
                            solution.Add(new issueSeller { issue = i2, seller = seller });
                            remainingIssueList.Remove(i2);
                        }

                    if (remainingIssueList.Count == 0)
                        yield return solution;
                    else
                        foreach (List<issueSeller> lis in Solver(remainingIssueList))
                        {
                            List<issueSeller> sol = new List<issueSeller>(solution);
                            sol.AddRange(lis);
                            yield return sol;
                        }
                }
            }
        }

        /*
        private class ListLevel
        {
            public int level;
            public List<issueSeller> list;
        }

        private static Stack<ListLevel> stack;
        */
        private static Stack<List<issueSeller>> stackList = new Stack<List<issueSeller>>();
        private static Stack<int> stackLevel = new Stack<int>();

        static IEnumerable<List<issueSeller>> StackSolver(List<int> issueList)
        {
            // Build initial list
            List<issueSeller> lis = new List<issueSeller>();
            foreach (int issue in issueList)
                lis.Add(new issueSeller { issue = issue, seller = null });

            stackList.Push(lis);
            stackLevel.Push(0);

            while (stackLevel.Count > 0)
            {
                var level = stackLevel.Pop();
                var list = stackList.Pop();
                if (level == issueList.Count)
                    yield return list;
                else
                {
                    // Take the first issue with no seller
                    int issue = list[level].issue;

                    // Look for all sellers
                    foreach (string seller in dicSellersList[issue])
                    {
                        var nl = new List<issueSeller>(list);
                        nl[level] = new issueSeller { issue = issue, seller = seller };
                        stackList.Push(nl);
                        stackLevel.Push(level + 1);
                    }
                }
            }
        }


        private static void InitializeData()
        {
            /*
            AP("mirkaetrox", 156, 1.50, 4.60); AP("mirkaetrox", 158, 1.50, 2.90);
            AP("collectorliv", 165, 1.80, 2.90); AP("collectorliv", 173, 2.09, 2.90);
            AP("philou67", 165, 1.50, 2.90); AP("philou67", 167, 1.80, 2.90); AP("philou67", 172, 3.80, 2.90); AP("philou67", 174, 2.60, 2.90); AP("philou67", 175, 2.70, 2.90);
            AP("bern89", 168, 1.20, 4.00); AP("bern89", 205, 1.50, 2.90);
            AP("venteamat", 165, 1.50, 4.00); AP("venteamat", 175, 1.05, 4.00);
            AP("verachuck", 129, 0.90, 2.90);
            AP("hugomo44", 158, 0.90, 2.90);
            AP("nathlegier59", 167, 0.90, 2.90);
            AP("drjones94", 172, 0.90, 2.90);
            AP("eliannie52", 174, 0.90, 2.90);
            AP("veruca1", 175, 0.90, 2.90);
            AP("lydia98", 179, 0.90, 2.90);
            AP("rob-rekin", 207, 0.90, 2.90);
            AP("algod", 209, 0.90, 2.90);
            AP("dae4", 165, 1.50, 2.90); AP("dae4", 179, 1.50, 2.90); AP("dae4", 180, 1.50, 4.60);
            AP("frmystic", 205, 1.50, 2.90); AP("frmystic", 206, 1.50, 2.90); AP("frmystic", 207, 3.00, 2.90);
            AP("noajean", 127, 1.50, 2.90); AP("noajean", 207, 1.50, 2.90);
            AP("audrey5126", 173, 1.50, 2.90); AP("audrey5126", 180, 1.50, 2.90);
            AP("touriste7401", 175, 0.90, 4.00); AP("touriste7401", 180, 0.90, 4.00);
            AP("patpero", 207, 1.50, 2.90); AP("patpero", 209, 0.90, 2.90);
            AP("senosteph", 158, 1.50, 4.60); AP("senosteph", 168, 1.50, 4.60); AP("senosteph", 171, 1.50, 4.60); AP("senosteph", 173, 1.50, 4.60); AP("senosteph", 174, 1.50, 4.60); AP("senosteph", 179, 1.50, 4.60);
            AP("billiedog", 168, 1.75, 2.90); AP("billiedog", 174, 1.35, 2.90); AP("billiedog", 179, 1.35, 4.60); AP("billiedog", 180, 1.35, 4.60); AP("billiedog", 205, 1.50, 2.90); AP("billiedog", 207, 0.90, 2.90);
            AP("felix03", 158, 1.30, 2.90); AP("felix03", 165, 1.50, 2.90); AP("felix03", 171, 1.50, 2.90); AP("felix03", 174, 0.90, 2.90);
            AP("domdom311", 158, 1.00, 2.90); AP("domdom311", 168, 1.00, 2.90); AP("domdom311", 171, 1.00, 4.00); AP("domdom311", 179, 1.00, 4.00);
            AP("cludu", 205, 1.07, 2.90); AP("cludu", 206, 1.35, 2.90); AP("cludu", 207, 0.90, 2.90);
            AP("(sojumali)", 158, 0.90, 2.90); AP("(sojumali)", 165, 1.50, 4.00); AP("(sojumali)", 167, 0.90, 4.00); AP("(sojumali)", 171, 1.50, 2.90); AP("(sojumali)", 172, 0.90, 2.90); AP("(sojumali)", 173, 1.50, 2.90); AP("(sojumali)", 174, 0.90, 2.90);
            AP("margueritehc", 168, 0.90, 2.90); AP("margueritehc", 174, 0.90, 2.90); AP("margueritehc", 180, 0.90, 2.90);
            AP("celinefleur1", 158, 0.90, 2.90); AP("celinefleur1", 165, 1.50, 2.90); AP("celinefleur1", 167, 0.90, 4.00); AP("celinefleur1", 172, 0.90, 2.90); AP("celinefleur1", 173, 1.30, 2.90); AP("celinefleur1", 175, 0.90, 2.90); AP("celinefleur1", 205, 1.07, 2.90);
            */

            AP("patfrita", 156, 1.50, 4.60);
            AP("mirkaetrox", 156, 1.50, 4.60);
            AP("bopas38", 174, 1.50, 4.60);
            AP("jean-marc", 168, 2.00, 2.90); AP("jean-marc", 171, 1.50, 4.00);
            AP("wilherm", 168, 2.00, 3.50); AP("wilherm", 174, 3.00, 3.50);
            AP("bigdom", 127, 1.50, 4.60);
            AP("ricbez", 168, 2.00, 3.50); AP("ricbez", 171, 1.50, 3.50);
            AP("theolito", 206, 2.00, 2.90); AP("theolito", 207, 2.00, 2.90);
            AP("philou67", 174, 2.60, 2.90);
            AP("bern89", 168, 1.20, 4.00); AP("bern89", 205, 1.50, 2.90);
            AP("verachuck", 129, 0.90, 2.90);
            AP("eliannie52", 174, 0.90, 2.90);
            AP("lydia98", 179, 0.90, 2.90);
            AP("rob-rekin", 207, 0.90, 2.90);
            AP("algod", 209, 0.90, 2.90);
            AP("dae4", 179, 1.50, 2.90); AP("dae4", 180, 1.50, 4.60);
            AP("frmystic", 205, 1.50, 2.90); AP("frmystic", 206, 1.50, 2.90); AP("frmystic", 207, 3.00, 2.90);
            AP("noajean", 127, 1.50, 2.90); AP("noajean", 207, 1.50, 2.90);
            AP("audrey5126", 180, 1.50, 2.90);
            AP("touriste7401", 180, 0.90, 4.00);
            AP("patpero", 207, 1.50, 2.90); AP("patpero", 209, 0.90, 2.90);
            AP("senosteph", 168, 1.50, 4.60); AP("senosteph", 171, 1.50, 4.60); AP("senosteph", 174, 1.50, 4.60); AP("senosteph", 179, 1.50, 4.60);
            AP("billiedog", 168, 1.75, 2.90); AP("billiedog", 174, 1.35, 2.90); AP("billiedog", 179, 1.35, 4.60); AP("billiedog", 180, 1.35, 4.60); AP("billiedog", 205, 1.50, 2.90); AP("billiedog", 207, 0.90, 2.90);
            AP("felix03", 171, 1.50, 2.90); AP("felix03", 174, 0.90, 2.90);
            AP("domdom311", 168, 1.00, 2.90); AP("domdom311", 171, 1.00, 4.00); AP("domdom311", 179, 1.00, 4.00);
            AP("cludu", 205, 1.07, 2.90); AP("cludu", 206, 1.35, 2.90); AP("cludu", 207, 0.90, 2.90);
            AP("(sojumali)", 171, 1.50, 2.90); AP("(sojumali)", 174, 0.90, 2.90);
            AP("margueritehc", 168, 0.90, 2.90); AP("margueritehc", 174, 0.90, 2.90); AP("margueritehc", 180, 0.90, 2.90);
            AP("celinefleur1", 205, 1.07, 2.90);

        }

        private static void AP(string seller, int issue, double issuePrice, double shipmentPrice)
        {
            if (!dicSellersList.ContainsKey(issue))
            {
                issueList.Add(issue);
                dicSellersList.Add(issue, new List<string>());
            }
            dicSellersList[issue].Add(seller);
            if (!dicIssuesList.ContainsKey(seller))
                dicIssuesList.Add(seller, new List<int>());
            dicIssuesList[seller].Add(issue);
            string key = issue.ToString() + seller;
            dicPriceIssue.Add(key, issuePrice);
            dicPriceShipment.Add(key, shipmentPrice);
        }
    }
}
