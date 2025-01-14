def calculate_bmi(height, weight):
    # Calcule le BMI
    if height <= 0 or weight <= 0:
        raise ValueError("La taille et le poids doivent être supérieurs à zéro.")
    bmi = weight / (height ** 2)
    return bmi

def calculate_bmr(height, weight, age, gender):
    # Calcule le BMR
    if not isinstance(weight, (int, float)) or not isinstance(height, (int, float)) or not isinstance(age, int):
        raise ValueError("Le poids, la taille et l'âge doivent être des valeurs numériques.")
    
    if gender == 'male':
        return 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age)
    elif gender == 'female':
        return 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age)
    else:
        raise ValueError("Le genre doit être 'male' ou 'female'.")

