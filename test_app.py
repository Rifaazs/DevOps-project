# Import des modules nécessaires
import unittest  # Module de test unitaire Python
from flask import Flask, jsonify  # Framework Flask pour l'API web
from health_utils import calculate_bmi, calculate_bmr  # Import des fonctions à tester

# Définition de la classe de test qui hérite de unittest.TestCase
class TestCalculator(unittest.TestCase):
    
    # Test de la fonction de calcul de l'IMC (BMI)
    def test_calculate_bmi(self):
        height = 1.75  # Taille en mètres
        weight = 70    # Poids en kilogrammes
        result = calculate_bmi(height, weight)  # Appel de la fonction à tester
        # Vérifie que le résultat est égal à 22.86 avec une précision de 2 décimales
        self.assertAlmostEqual(result, 22.86, places=2)
    
    # Test de la fonction de calcul du métabolisme de base (BMR)
    def test_calculate_bmr(self):
        height = 175   # Taille en centimètres
        weight = 70    # Poids en kilogrammes
        age = 25       # Âge en années
        gender = 'male'  # Genre de la personne
        result = calculate_bmr(height, weight, age, gender)  # Appel de la fonction à tester
        # Vérifie que le résultat est égal à 1724.05 avec une précision de 2 décimales
        self.assertAlmostEqual(result, 1724.05, places=2)

# Point d'entrée du script
if __name__ == '__main__':
    unittest.main()  # Lance l'exécution des tests



 
