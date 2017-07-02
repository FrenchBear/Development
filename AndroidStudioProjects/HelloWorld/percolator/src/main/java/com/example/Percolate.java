// Dev for fun, projet #5, Percolation en Java
// 2016-02-23 PV

package com.example;

import java.util.*;

public class Percolate {
    static Random rnd = new Random();


    public static void main(String[] args) {
        int n = 500;
        int s = 50;
        System.out.format("Proba percolation grille en fonction de la densité, size=%dx%d, %d tests par densité\n", s, s, n);
        for (double p = 0.3; p < 0.5005; p += 0.005) {
            double r = TestProbability(p, s, n);
            System.out.format("%5.3f  %f\n", p, r);
        }
        /*
        int[][] g = CreateGrid(20,20,0.4);
        boolean p = Percolate(g);
        PrintGrid(g);
        System.out.println(p);
        */
    }

    private static int[][] CreateGrid(int h, int w, double p) {
        int[][] g = new int[h][w];
        for (int r = 0; r < h; r++) {
            for (int c = 0; c < w; c++) {
                if (rnd.nextDouble() < p)
                    g[r][c] = 2;
            }
        }
        return g;
    }

    private static void PrintGrid(int[][] g) {
        int h = g.length;
        for (int r = 0; r < g.length; r++) {
            for (int c = 0; c < g[r].length; c++) {
                switch (g[r][c]) {
                    case 0:
                        System.out.print("..");
                        break;
                    case 1:
                        System.out.print("oo");
                        break;
                    case 2:
                        System.out.print("##");
                        break;
                }
            }
            System.out.println();
        }
    }

    private static boolean Percolate(int[][] g) {
        int h = g.length;
        int w = g[0].length;

        LinkedList<Cell> ecl = new LinkedList<Cell>();
        for (int c = 0; c < g[0].length; c++) {
            if (g[0][c] == 0) {
                ecl.add(new Cell(0, c));
            }
        }

        while (!ecl.isEmpty()) {
            Cell cc = ecl.removeFirst();
            int r = cc.row();
            int c = cc.col();
            if (g[r][c] == 0) {
                g[r][c] = 1;
                if (r > 0 && g[r - 1][c] == 0) ecl.add(new Cell(r - 1, c));
                if (r < h - 1 && g[r + 1][c] == 0) ecl.add(new Cell(r + 1, c));
                if (c > 0 && g[r][c - 1] == 0) ecl.add(new Cell(r, c - 1));
                if (c < w - 1 && g[r][c + 1] == 0) ecl.add(new Cell(r, c + 1));
            }
        }

        // A la fin, on vérifie si au moins une cellule de la dernière ligne a percolé
        for (int c = 0; c < w; c++) {
            if (g[h - 1][c] == 1)
                return true;
        }
        return false;
    }

    private static double TestProbability(double p, int s, int n) {
        int nt = 0;
        for (int i = 0; i < n; i++) {
            int[][] g = CreateGrid(s, s, p);
            if (Percolate(g))
                nt++;
        }
        return nt / (double) n;
    }

}


class Cell {
    private final int row;
    private final int col;

    public Cell(int row, int col) {
        super();
        this.row = row;
        this.col = col;
    }

    public int hashCode() {
        return (row + col) * col + row;
    }

    public boolean equals(Object other) {
        if (other instanceof Cell) {
            Cell otherCell = (Cell) other;
            return this.row == otherCell.row && this.col == otherCell.col;
        }
        return false;
    }

    public String toString() {
        return "(" + row + ", " + col + ")";
    }

    public int row() {
        return row;
    }

    public int col() {
        return col;
    }

}