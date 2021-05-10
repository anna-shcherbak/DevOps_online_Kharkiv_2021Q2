import unittest
from calculator_enhanced import Calculator


class TestCalculator_add(unittest.TestCase):

    def setUp(self):
        self.calculator = Calculator()

    def test_add(self):
        self.assertEqual(self.calculator.add(15, 7), 22)

    def test_add_float(self):
        self.assertEqual(self.calculator.add(15.5, 7.5), 23)

    def test_add_int_str(self):
        self.assertEqual(self.calculator.add(15, "6"), "ERROR")

    def test_addition_negative_integers(self):
        self.assertEqual(self.calculator.add(-5, -6), -11)
        self.assertNotEqual(self.calculator.add(-5, -6), 11)

class TestCalculator_subtract(unittest.TestCase):

    def setUp(self):
        self.calculator = Calculator()

    def test_subtract(self):
        self.assertEqual(self.calculator.subtract(15, 5), 10)

    def test_subtract_float(self):
        self.assertEqual(self.calculator.subtract(15.5, 7.1), 8.4)

    def test_subtract_int_str(self):
        self.assertEqual(self.calculator.subtract(15, "6"), "ERROR")

    def test_subtract_negative_integers(self):
        self.assertEqual(self.calculator.subtract(-5, -6), 1)

class TestCalculator_multiply(unittest.TestCase):

    def setUp(self):
        self.calculator = Calculator()

    def test_multiply(self):
        self.assertEqual(self.calculator.multiply(4, 5), 20)

    def test_multiply_float(self):
        self.assertEqual(self.calculator.multiply(15.5, 7.1), 110.05)

    def test_multiply_int_str(self):
        self.assertEqual(self.calculator.multiply(15, "6"), "ERROR")

    def test_multiply_negative_integers(self):
        self.assertEqual(self.calculator.multiply(-5, -6), 30)

class TestCalculator_divide(unittest.TestCase):

    def setUp(self):
        self.calculator = Calculator()

    def test_divide(self):
        self.assertEqual(self.calculator.divide(10, 2), 5)

    def test_divide_by_zero_exception(self):
        with self.assertRaises(ZeroDivisionError):
            self.calculator.divide(10, 0)

    def test_divide_float(self):
        self.assertEqual(self.calculator.divide(15.25, 6.1), 2.5)

    def test_divide_int_str(self):
        self.assertEqual(self.calculator.divide(15, "6"), "ERROR")

    def test_divide_negative_integers(self):
        self.assertEqual(self.calculator.divide(-30, -6), 5)
