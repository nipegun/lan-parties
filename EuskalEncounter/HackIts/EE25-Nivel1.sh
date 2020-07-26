#!/bin/bash

# Pongo a disposición pública este script bajo el término de "software de dominio público".
# Puedes hacer lo que quieras con él porque es libre de verdad; no libre con condiciones como las licencias GNU y otras patrañas similares.
# Si se te llena la boca hablando de libertad entonces hazlo realmente libre.
# No tienes que aceptar ningún tipo de términos de uso o licencia para utilizarlo o modificarlo porque va sin CopyLeft.

#----------------------------------------------------------------------------------
#  Script De NiPeGun para resolver el HackIt Nivel 1 de la Euskal Encounter 25.
#  Es necesario instalar los paquetes curl y jq antes de la ejecución del script.
#----------------------------------------------------------------------------------

echo "" > /PuestosHackIt2017.txt

echo ""
echo "PROCESANDO LA ZONA A"
echo ""
for FilaZonaA in {A..T}
  do
    for ColumnaZonaA in {1..128}
      do
        echo -n $(curl -s https://eps.party.eus/ee25/map/lookup/A$FilaZonaA"_"$ColumnaZonaA | jq -r '.state') | cat -A >> /PuestosHackIt2017.txt
      done
  done

echo ""
echo "PROCESANDO LA ZONA B"
echo ""
for FilaZonaB in {A..T}
  do
    for ColumnaZonaB in {1..128}
      do
        echo -n $(curl -s https://eps.party.eus/ee25/map/lookup/B$FilaZonaB"_"$ColumnaZonaB | jq -r '.state') | cat -A >> /PuestosHackIt2017.txt
      done
  done

echo ""
echo "Reemplazando palabras por letras únicas"
echo ""
sed -i -e 's|reserved|R|g' /PuestosHackIt2017.txt
sed -i -e 's|taken|T|g'    /PuestosHackIt2017.txt
sed -i -e 's|open|O|g'     /PuestosHackIt2017.txt
sed -i -e 's|present|P|g'  /PuestosHackIt2017.txt
sed -i -e 's|null|N|g'     /PuestosHackIt2017.txt

cat /PuestosHackIt2017.txt

