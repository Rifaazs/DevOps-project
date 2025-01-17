def calculate_bmi(height, weight):
    # Calcule l'Indice de Masse Corporelle (IMC/BMI)
    # Paramètres:
    #   height: taille en mètres (float)
    #   weight: poids en kilogrammes (float)
    # Retourne: BMI (float)
    
    if height <= 0 or weight <= 0:
        # Vérifie que les valeurs sont positives
        raise ValueError("La taille et le poids doivent être supérieurs à zéro.")
    
    # Formule du BMI : poids / (taille²)
    bmi = weight / (height ** 2)
    return bmi

def calculate_bmr(height, weight, age, gender):
    # Calcule le métabolisme de base (BMR) selon la formule de Mifflin-St Jeor
    # Paramètres:
    #   height: taille en centimètres (float)
    #   weight: poids en kilogrammes (float)
    #   age: âge en années (int)
    #   gender: sexe ('male' ou 'female')
    # Retourne: BMR en calories (float)
    
    # Vérifie que les paramètres numériques sont du bon type
    if not isinstance(weight, (int, float)) or not isinstance(height, (int, float)) or not isinstance(age, int):
        raise ValueError("Le poids, la taille et l'âge doivent être des valeurs numériques.")
    
    # Calcule le BMR selon des formules différentes pour hommes et femmes
    if gender == 'male':
        # Formule pour les hommes
        return 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age)
    elif gender == 'female':
        # Formule pour les femmes
        return 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age)
    else:
        # Lève une erreur si le genre n'est pas valide
        raise ValueError("Le genre doit être 'male' ou 'female'.")
