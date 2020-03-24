# Exercice 1
# Utiliser un appel système comme write

# Segements quand utiliser .data/.text?
# =====================================
#
# .data pour les données connues à la compilation genre les chaines ou des tableaux
# de taille connue.
# .text pour le code. :)

# On indique qu'on souhaite ranger des données dans le segment de data.
.data

# la directive .asciz permet de déclarer une chaine fini par un 0x00, '\0' en ascii.
message: .asciz "Hello ASM from .data"
int: .word  12

.text # <- segment de code.

# Exercice: Observation dans Rars
#
# - Quelle est l'addresse de base de la chaine msg?  0x10010000  Son addresse de fin? 0x10010019
# - Dans quelle segment de la mémoire est elle? data segment 
# - Quelle sont les valeurs en hexadecimales présente dans .data?
# -  0x6c6c6548    0x5341206f   0x7266204d   0x2e206d6f   0x61746164  0x00000000   0x00000000   0x00000000



# la: Load Address, charge une adresse (label) dans un registre
la a0, message # argument de l'appel systeme
li a7, 4 # appel systeme numéro 4 selon la doc de Rars printString
ecall      # Permet de basculer en mode kernel pour faire l'appel systeme

# Bonus: Afficher maintenant un nombre, vous aurrez besoin de la documentation.


la t0, int
lw a0, 0(t0)
li a7, 1
ecall


