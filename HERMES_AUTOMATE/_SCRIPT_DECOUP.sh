#!/bin/bash
#
# SimpleLine @ 500 - i=0; d=0; for f in *; do if [ $(($i % 500)) -eq 0 ]; then let d++; mkdir dossier$d; fi; mv "$f" dossier$d; let i++; done

# Cree autant de repertoire "dossierN" qu'il y a de paquets de 500 fichiers a faire
# A executer dans le dossier ou sont les fichiers
#

# Initialisation
i=0
d=0

# Boucle sur tous les fichiers du dossier
for f in *; do
# On verifie si on est modulo 80 pour creer un dossier supplementaire
        if [ $(($i % 80)) -eq 0 ]; then
                let d++
                mkdir dossier$d
        fi
# On deplace le fichier
        mv "$f" dossier$d
        let i++
done