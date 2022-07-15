package tdd.by.example;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;


public class DollarTest extends TestCase
{
    public DollarTest(String testName) {
        super( testName );
    }

    public static Test suite() {
        return new TestSuite( DollarTest.class );
    }

    public void testMultiplication() {
        Dollar five = new Dollar(5);
        assertEquals(new Dollar(10), five.times(2));
        assertEquals(new Dollar(15), five.times(3));
    }

    public void testEquality() {
        assertTrue(new Dollar(5).equals(new Dollar(5)));
        assertFalse(new Dollar(5).equals(new Dollar(6)));
    }
}
