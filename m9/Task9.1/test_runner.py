import unittest
import test_calculator

calcTestSuite = unittest.TestSuite()
calcTestSuite.addTest(unittest.makeSuite(test_calculator.TestCalculator_add))
calcTestSuite.addTest(unittest.makeSuite(test_calculator.TestCalculator_subtract))
calcTestSuite.addTest(unittest.makeSuite(test_calculator.TestCalculator_multiply))
calcTestSuite.addTest(unittest.makeSuite(test_calculator.TestCalculator_divide))
print("count of tests: " + str(calcTestSuite.countTestCases()) + "\n")

runner = unittest.TextTestRunner(verbosity=2)
runner.run(calcTestSuite)