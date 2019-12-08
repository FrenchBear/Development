using System.Collections.ObjectModel;
using System.ComponentModel;  
using System; 

namespace SudokuFX
{
    public class Cell: INotifyPropertyChanged 
    {
        public Cell(int maxval)
        {
            possibleValuesValue = new ObservableCollection<int?>
            {
                null
            };
            for (int i = 1; i <= maxval; i++)
            {
                possibleValuesValue.Add(i);  
            }
        }
        bool readOnlyValue = false;
        public bool ReadOnly
        {
            get
            {
                return readOnlyValue; 
            }
            set
            {
                if (readOnlyValue != value)
                {
                    readOnlyValue = value;
                    PropertyChanged?.Invoke(this,
                        new PropertyChangedEventArgs("ReadOnly"));
                }
            }
        }
        int? valueValue = null;
        public int? Value
        {
            get
            {
                return valueValue; 
            }
            set
            {
                if (valueValue != value)
                {
                    valueValue = value;
                    PropertyChanged?.Invoke(this, new PropertyChangedEventArgs("Value"));
                }
            }
        }

        readonly ObservableCollection<int?> possibleValuesValue;
        public ObservableCollection<int?> PossibleValues
        {
            get
            {
                return possibleValuesValue; 
            }
        }
        bool isValidValue = true;
        public bool IsValid
        {
            get
            {
                return isValidValue;
            }
            set
            {
                if (isValidValue != value)
                {
                    isValidValue = value;
                    PropertyChanged?.Invoke(this, new PropertyChangedEventArgs("IsValid"));
                }
            }
        }
        #region INotifyPropertyChanged Members
        public event PropertyChangedEventHandler PropertyChanged;
        #endregion
    }

    public class InnerGrid : INotifyPropertyChanged 
    {
        readonly ObservableCollection<ObservableCollection<Cell>> Rows;
        public ObservableCollection<ObservableCollection<Cell>> GridRows
        {
            get
            {
                return Rows;
            }
        }
        public InnerGrid(int size)
        {
            Rows = new ObservableCollection<ObservableCollection<Cell>>();
            for (int i = 0; i < size; i++)
            {
                ObservableCollection<Cell> Col = new ObservableCollection<Cell>();
                for (int j = 0; j < size; j++)
                {
                    Cell c = new Cell(size*size);
                    c.PropertyChanged += new PropertyChangedEventHandler(c_PropertyChanged); 
                    Col.Add(c);  
                }
                Rows.Add(Col);  
            }
        }

        void c_PropertyChanged(object sender, PropertyChangedEventArgs e)
        {
            if (e.PropertyName == "Value")
            {
                bool valid = CheckIsValid();

                foreach (ObservableCollection<Cell> r in Rows)
                {
                    foreach (Cell c in r)
                    {
                        c.IsValid = valid;
                    }
                }
               
                isValidValue = valid;
                PropertyChanged?.Invoke(this, new PropertyChangedEventArgs("IsValid"));
            }
        }
        bool isValidValue = true;
        public bool IsValid
        {
            get
            {
                return isValidValue; 
            }
        }
        private bool CheckIsValid()
        {
            bool[] used = new bool[Rows.Count * Rows.Count];      
            foreach (ObservableCollection<Cell> r in Rows)
            {
                foreach (Cell c in r)
                {
                    if (c.Value.HasValue)
                    {
                        if (used[c.Value.Value-1])
                        {
                            return false; //this is a duplicate
                        }
                        else
                        {
                            used[c.Value.Value-1] = true; 
                        }
                    }
                 }
            }
            return true;
        }
        #region INotifyPropertyChanged Members
        public event PropertyChangedEventHandler PropertyChanged;
        #endregion

        public Cell this[int row, int col]
        {
            get
            {
                if (row < 0 || row >= Rows.Count) throw new ArgumentOutOfRangeException("row", row, "Invalid Row Index");
                if (col < 0 || col >= Rows.Count) throw new ArgumentOutOfRangeException("col", col, "Invalid Column Index");
                return Rows[row][col];
            }
        }


    }

    public class Board :  INotifyPropertyChanged
    {
        readonly ObservableCollection<ObservableCollection<InnerGrid>> Rows;
        public ObservableCollection<ObservableCollection<InnerGrid>> GridRows
        {
            get
            {
                return Rows;
            }
        }
        public int Size
        {
            get
            {
                return Rows.Count * Rows.Count; 
            }
        }

        public Board(int totalsize)
        {
            int size = (int)Math.Sqrt(totalsize);  
            Rows = new ObservableCollection<ObservableCollection<InnerGrid>>();
            for (int i = 0; i < size; i++)
            {
                ObservableCollection<InnerGrid> Col = new ObservableCollection<InnerGrid>();
                for (int j = 0; j < size; j++)
                {
                    InnerGrid g = new InnerGrid(size);
                    g.PropertyChanged += new PropertyChangedEventHandler(g_PropertyChanged);
                    Col.Add(g);
                }
                Rows.Add(Col);
            }
        }
        public int?[,] ToArray()
        {
            int?[,] t = new int?[this.Size, this.Size];
            for (int r = 0; r < this.Size; r++)
            {
                for (int c = 0; c < this.Size; c++)
                {
                    Cell cell = this[r, c];
                    if (cell.ReadOnly)
                    {
                        t[r, c] = -cell.Value; 
                    }
                    else
                    {
                        t[r, c] = cell.Value; 
                    }
                }
            }
            return t;
        }
        public void FromArray(int?[,] t)
        {
            if (t.GetLength(0) != t.GetLength(1) || t.GetLength(0) != this.Size)
            {
                throw new ArgumentOutOfRangeException("t", t, "Array is incorrect size");
            }
            for (int r = 0; r < this.Size; r++)
            {
                for (int c = 0; c < this.Size; c++)
                {
                    if (t[r, c] < 0)
                    {
                        this[r, c].Value = -t[r, c];
                        this[r, c].ReadOnly = true;
                    }
                    else
                    {
                        this[r, c].Value = t[r, c];
                    }

                    
                }
            }
        }
        public void GenerateGameUsingSolver(ISudokuSolver s, int givens)
        {
            int size = Rows.Count * Rows.Count;
            if (givens < 0 || givens > size * size)
            {
                throw new ArgumentOutOfRangeException("givens", givens, "Invalid number of givens");
            }
            for (int r = 0; r < size; r++)
            {
                for (int c = 0; c < size; c++)
                {
                    Cell cell = this[r, c];
                    cell.ReadOnly = false;
                    cell.Value = null;
                }
            }
            Random rnd = new Random();
            int row = rnd.Next(size);
            int col = rnd.Next(size);
            this[row, col].Value = rnd.Next(size)+1;
            int?[,] a = this.ToArray();
            s.Solve(ref a);
            this.FromArray(a);
            for (int i = 0; i < (size * size) - givens; i++)
            {

                for (; ; )
                {
                    int r = rnd.Next(size);
                    int c = rnd.Next(size);

                    Cell cell = this[r, c];
                    if (!cell.Value.HasValue) continue;  
                    cell.Value = null;
                    cell.ReadOnly = false;
                    break;
                }
            }
            for (int r = 0; r < size; r++)
            {
                for (int c = 0; c < size; c++)
                {
                    Cell cell = this[r, c];
                    if (cell.Value.HasValue) cell.ReadOnly = true;
                }
            }
        }
        public void GenerateGame(int givens)
        {
            int size = Rows.Count * Rows.Count;  
            if (givens < 0 || givens > size*size)
            {
                throw new ArgumentOutOfRangeException("givens", givens, "Invalid number of givens");
            }
            for (int r = 0 ; r < size; r++)
            {
                for(int c = 0; c < size; c++)
                {
                    Cell cell = this[r,c];
                    cell.ReadOnly = false;
                    cell.Value = null;
                }
            }
            Random rnd = new Random();  
            for (int i = 0; i < givens; i++)
            {
                bool givenFound;
                do
                {
                    givenFound = false;
                    Cell cell; // = null;
                    do
                    {
                        int row = rnd.Next(size);
                        int col = rnd.Next(size);
                        cell = this[row, col];
                    }
                    while (cell.Value != null);
                    int baseVal = rnd.Next(size) + 1;
                    for (int v = 0; v < size; v++)
                    {
                        cell.Value = baseVal;
                        if (this.IsValid)
                        {
                            cell.ReadOnly = true;
                            givenFound = true;
                            break;
                        }
                        baseVal++;
                        if (baseVal > size) baseVal = 1;
                    }
                    if (!givenFound) cell.Value = null;
                }
                while (!givenFound);     
            
            }

        }
        void g_PropertyChanged(object sender, PropertyChangedEventArgs e)
        {
            if (e.PropertyName == "IsValid")
            {
                bool valid = true;
                int totalsize = Rows.Count * Rows.Count;
                isFullValue = true;
                for (int i = 0; i < totalsize; i++)
                {
                    bool rowValid = CheckRowIsValid(i);
                    bool[] colValid = new bool[totalsize];
                    for (int j = 0; j < totalsize; j++)
                    {
                        if (this[i, j].Value == null) isFullValue = false;
                        colValid[j] = CheckColumnIsValid(j);
                    }
                    for (int j = 0; j < totalsize; j++)
                    {
                        bool innerGridValid = Rows[i / Rows.Count][j / Rows.Count].IsValid;
                        if (!colValid[j] || !rowValid || !innerGridValid) valid = false; 
                        this[i, j].IsValid = colValid[j] & rowValid & innerGridValid;
                    }
                }
                isValidValue = valid;
                PropertyChanged?.Invoke(this, new PropertyChangedEventArgs("IsValid"));
                PropertyChanged?.Invoke(this, new PropertyChangedEventArgs("IsFull"));
            }
        }
        bool isValidValue = true;
        public bool IsValid
        {
            get
            {
                return isValidValue;
            }
        }
        bool isFullValue = false;
        public bool IsFull
        {
            get
            {
                return isFullValue;
            }
        }

        private bool CheckRowIsValid(int row)
        {
            int width = Rows.Count * Rows.Count;   
            bool[] used = new bool[width];
            for (int i = 0; i < width; i++)
            {
                Cell c = this[row, i];
                if (c.Value.HasValue)
                {
                    if (used[c.Value.Value-1])
                    {
                        return false;
                    }
                    else
                    {
                        used[c.Value.Value-1] = true; 
                    }
                }
            }
            return true;
        }
        private bool CheckColumnIsValid(int col)
        {
            int height = Rows.Count * Rows.Count;
            bool[] used = new bool[height];
            for (int i = 0; i < height; i++)
            {
                Cell c = this[i, col];
                if (c.Value.HasValue)
                {
                    if (used[c.Value.Value-1])
                    {
                        return false;
                    }
                    else
                    {
                        used[c.Value.Value-1] = true;
                    }
                }
            }
            return true;
        }
        #region INotifyPropertyChanged Members
        public event PropertyChangedEventHandler PropertyChanged;
        #endregion

        public Cell this[int row, int col]
        {
            get
            {
                int totalsize = Rows.Count * Rows.Count;
                if (row < 0 || row >= totalsize) throw new ArgumentOutOfRangeException("row", row, "Invalid Row Index");
                if (col < 0 || col >= totalsize) throw new ArgumentOutOfRangeException("col", col, "Invalid Column Index");
                return Rows[row / Rows.Count][col / Rows.Count][row % Rows.Count,col % Rows.Count];
            }
        }


    }
}