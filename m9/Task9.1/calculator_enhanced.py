class Calculator:
    def add(self, a, b):
        if isinstance(a, (int, float, complex)) and isinstance(b, (int, float, complex)):
            return a + b
        else:
            return "ERROR"

    def subtract(self, a, b):
        if isinstance(a, (int, float, complex)) and isinstance(b, (int, float, complex)):
            return a - b
        else:
            return "ERROR"

    def multiply(self, a, b):
        if isinstance(a, (int, float, complex)) and isinstance(b, (int, float, complex)):
            return a * b
        else:
            return "ERROR"

    def divide(self, a, b):
        if isinstance(a, (int, float, complex)) and isinstance(b, (int, float, complex)):
                return a / b

        else:
            return "ERROR"
