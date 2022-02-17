#!/bin/bash
#
# SimpleLine  - for f in *; do zip "$f.zip" "$f"/*; done

# Zippe tous les sous-dossiers d'un dossier
# ATTENTION, pas de Dossiers VIDES = Erreur

# Initialisation

# Boucle sur tous les dossiers du dossier
for f in *; do
# On zippe
        zip "$f.zip" "$f"/*;
done