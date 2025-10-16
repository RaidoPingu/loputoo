matrix = []

# Loeme failist maatriksi read ja jagame väärtused veergudeks
with open("output.txt", "r", encoding="utf-8") as file:
    for algRida in file:
        rida = algRida.strip()
        if rida:
            matrix.append([int(vaartus) for vaartus in rida.split()])

# Kuvame maatriksi sisu
print("Maatriks:")
for row in matrix:
    print(" ".join(str(number) for number in row))

# Arvutame ja näitame iga rea summa
print("\nRea summad:")
reaNumber = 1
for row in matrix:
    print(f"Rida {reaNumber}: {sum(row)}")
    reaNumber += 1

# Arvutame veerusummad käsitsi, et vältida lisamooduleid
veeruCount = len(matrix[0])
veeruSummaList = []
for veeruIndex in range(veeruCount):
    veeruSumma = 0
    for row in matrix:
        veeruSumma += row[veeruIndex]
    veeruSummaList.append(veeruSumma)

# Kuvame veergude summad
print("\nVeeru summad:")
veeruNumber = 1
for veeruSumma in veeruSummaList:
    print(f"Veerg {veeruNumber}: {veeruSumma}")
    veeruNumber += 1

# Leiame maatriksi suurima ja väikseima väärtuse
koikVaartused = []
for row in matrix:
    koikVaartused.extend(row)

print(f"\nSuurim arv: {max(koikVaartused)}")
print(f"Väikseim arv: {min(koikVaartused)}")
