import unittest
from flask import Flask, jsonify
from utils import calculate_bmi, calculate_bmr

class TestCalculator(unittest.TestCase):

    def test_calculate_bmi(self):
        height = 1.75  # en cm
        weight = 70   # en kg
        result = calculate_bmi(height, weight)
        self.assertAlmostEqual(result, 22.86, places=2)  # Valeur BMI plus réaliste

    def test_calculate_bmr(self):
        height = 175  # en cm
        weight = 70   # en kg
        age = 25      # en années
        gender = 'male'
        result = calculate_bmr(height, weight, age, gender)
        self.assertAlmostEqual(result, 1724.05, places=2)  # Valeur BMR plus réaliste

if __name__ == '__main__':
    unittest.main()
