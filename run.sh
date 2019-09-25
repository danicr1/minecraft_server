#!/bin/bash

#Selección de versión
echo "Versiones disponibles:"
PS3='Introduce el número asociado a la versión deseada y pulsa enter: '
options=("1.14.x" "1.13.x" "1.12.x" "1.11.x" "1.10.x" "1.9.x")
select opt in "${options[@]}"
do
    case $opt in
        "1.14.x")
            echo "Has seleccionado: $opt"
            parent_version=$opt
            break
            ;;
        "1.13.x")
            echo "Has seleccionado: $opt"
            parent_version=$opt
            break
            ;;
        "1.12.x")
            echo "Has seleccionado: $opt"
            parent_version=$opt
            break
            ;;
        "1.11.x")
            echo "Has seleccionado: $opt"
            parent_version=$opt
            break
            ;;
        "1.10.x")
            echo "Has seleccionado: $opt"
            parent_version=$opt
            break
            ;;
        "1.9.x")
            echo "Has seleccionado: $opt"
            parent_version=$opt
            break
            ;;
        *) echo "Opción no válida: $REPLY";;
    esac
done

echo
echo
echo "Ahora selecciona una versión específica:"

case $parent_version in
        "1.14.x")            
            PS3='Introduce el número asociado a la versión deseada y pulsa enter: '
            options=("1.14.4" "1.14.3" "1.14.2" "1.14.1" "1.14")
            select opt in "${options[@]}"
            do
                case $opt in
                    "1.14.4")
                        echo "Has seleccionado: $opt"
                        server_version=$opt
                        break
                        ;;
                    "1.14.3")
                        echo "Has seleccionado: $opt"
                        server_version=$opt
                        break
                        ;;
                    "1.14.2")
                        echo "Has seleccionado: $opt"
                        server_version=$opt
                        break
                        ;;
                    "1.14.1")
                        echo "Has seleccionado: $opt"
                        server_version=$opt
                        break
                        ;;
                    "1.14")
                        echo "Has seleccionado: $opt"
                        server_version=$opt
                        break
                        ;;
                    *) echo "Opción no válida: $REPLY";;
                esac
            done
            ;;
        "1.13.x")
            PS3='Introduce el número asociado a la versión deseada y pulsa enter: '
            options=("1.13.2" "1.13.1" "1.13" )
            select opt in "${options[@]}"
            do
                case $opt in
                    "1.13.2")
                        echo "Has seleccionado: $opt"
                        server_version=$opt
                        break
                        ;;
                    "1.13.1")
                        echo "Has seleccionado: $opt"
                        server_version=$opt
                        break
                        ;;
                    "1.13")
                        echo "Has seleccionado: $opt"
                        server_version=$opt
                        break
                        ;;
                    *) echo "Opción no válida: $REPLY";;
                esac
            done
            ;;
        "1.12.x")
            PS3='Introduce el número asociado a la versión deseada y pulsa enter: '
            options=("1.12.2" "1.12.1" "1.12")
            select opt in "${options[@]}"
            do
                case $opt in
                    "1.12.2")
                        echo "Has seleccionado: $opt"
                        server_version=$opt
                        break
                        ;;
                    "1.12.1")
                        echo "Has seleccionado: $opt"
                        server_version=$opt
                        break
                        ;;
                    "1.12")
                        echo "Has seleccionado: $opt"
                        server_version=$opt
                        break
                        ;;
                    *) echo "Opción no válida: $REPLY";;
                esac
            done
            ;;
        "1.11.x")
            PS3='Introduce el número asociado a la versión deseada y pulsa enter: '
            options=("1.11.2" "1.11.1" "1.11")
            select opt in "${options[@]}"
            do
                case $opt in
                    "1.11.2")
                        echo "Has seleccionado: $opt"
                        server_version=$opt
                        break
                        ;;
                    "1.11.1")
                        echo "Has seleccionado: $opt"
                        server_version=$opt
                        break
                        ;;
                    "1.11")
                        echo "Has seleccionado: $opt"
                        server_version=$opt
                        break
                        ;;
                    *) echo "Opción no válida: $REPLY";;
                esac
            done
            ;;
        "1.10.x")
            PS3='Introduce el número asociado a la versión deseada y pulsa enter: '
            options=("1.10.2" "1.10.1" "1.10")
            select opt in "${options[@]}"
            do
                case $opt in
                    "1.10.2")
                        echo "Has seleccionado: $opt"
                        server_version=$opt
                        break
                        ;;
                    "1.10.1")
                        echo "Has seleccionado: $opt"
                        server_version=$opt
                        break
                        ;;
                    "1.10")
                        echo "Has seleccionado: $opt"
                        server_version=$opt
                        break
                        ;;
                    *) echo "Opción no válida: $REPLY";;
                esac
            done
            ;;
        "1.9.x")
            PS3='Introduce el número asociado a la versión deseada y pulsa enter: '
            options=("1.9.4" "1.9.3" "1.9.2" "1.9.1" "1.9")
            select opt in "${options[@]}"
            do
                case $opt in
                    "1.9.4")
                        echo "Has seleccionado: $opt"
                        server_version=$opt
                        break
                        ;;
                    "1.9.3")
                        echo "Has seleccionado: $opt"
                        server_version=$opt
                        break
                        ;;
                    "1.9.2")
                        echo "Has seleccionado: $opt"
                        server_version=$opt
                        break
                        ;;
                    "1.9.1")
                        echo "Has seleccionado: $opt"
                        server_version=$opt
                        break
                        ;;
                    "1.9")
                        echo "Has seleccionado: $opt"
                        server_version=$opt
                        break
                        ;;
                    *) echo "Opción no válida: $REPLY";;
                esac
            done
            ;;
esac

echo
echo

# Toma el enlace correspondiente a la versión elegida del archivo json
server_download_link=$(grep -oP '(?<="'$server_version'": ")[^"]*' server_download_links.json)

# Si la opción -P de grep no está disponible
# server_download_link=$(grep -o '"'$server_version'": "[^"]*' infile | grep -o '[^"]*$')

# Arrancar el contenedor
docker run -p 25565:25565 --name minecraft_server --env server_download_link=$server_download_link danicr1/minecraft-server:0.1