package org.example;

public class Ant {
    public int calculate(int n, int left, int right) {
        if (left < right ){
            return Math.min(left + 1, n - right + 1);
        }
        else {
            return Math.min(left, n - right);
        }
    }
}
