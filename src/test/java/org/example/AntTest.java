package org.example;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

class AntTest {
    Ant ant = new Ant();
    @Test
    void test1() {
        assertEquals(ant.calculate(4,1,3), 2);
    };

    @Test
    void test2() {
        assertEquals(ant.calculate(4,4,1), 3);
    };
    @Test
    void test3() {
        assertEquals(ant.calculate(4,4,3), 1);
    };

    @Test
    void test4() {
        assertEquals(ant.calculate(3,3,1), 2);
    };



}