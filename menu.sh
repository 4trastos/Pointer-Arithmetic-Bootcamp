#!/bin/bash

# Configuración de colores
COLOR_RESET="\033[0m"
COLOR_TITLE="\033[1;36m"
COLOR_OPTION="\033[1;33m"
COLOR_SUCCESS="\033[1;32m"
COLOR_WARNING="\033[1;33m"
COLOR_ERROR="\033[1;31m"
COLOR_INFO="\033[1;34m"

# Descripciones de los bloques
descripciones=(
    "Fundamentos de punteros (direcciones, desreferencia, suma/resta)"
    "Punteros y arrays"
    "Punteros y cadenas"
    "Punteros y estructuras"
    "Punteros a punteros"
    "Memoria dinámica y punteros"
    "Punteros a funciones"
    "Casts y punteros genéricos"
    "Optimización con punteros"
    "Retos finales combinados"
)

# Función para mostrar el encabezado
show_header() {
    clear
    echo -e "${COLOR_TITLE}========================================"
    echo -e "🧠 Pointer Arithmetic Bootcamp"
    echo -e "========================================"
    echo -e "${COLOR_RESET}"
    echo -e "Bienvenido a tu programa de entrenamiento intensivo"
    echo -e "para dominar la aritmética de punteros en C."
    echo -e "Avanza bloque a bloque y conquista los punteros."
    echo -e ""
    echo -e "${COLOR_INFO}📘 Cada bloque contiene 10 ejercicios prácticos en C."
    echo -e "🔒 No puedes acceder a un bloque sin terminar el anterior.${COLOR_RESET}"
    echo -e ""
}

# Función para mostrar los bloques disponibles
show_blocks() {
    for i in $(seq 0 9); do
        bloque_num=$((i+1))
        bloque_dir="bloques/bloque$(printf "%02d" $bloque_num)"
        unlock_file="$bloque_dir/unlock_code.txt"
        
        # Determinar estado del bloque
        if [[ $bloque_num -eq 1 ]] || [[ -f "$unlock_file" ]]; then
            estado="${COLOR_SUCCESS}✅ Disponible${COLOR_RESET}"
        else
            estado="${COLOR_ERROR}🔒 Bloqueado${COLOR_RESET}"
        fi
        
        # Mostrar progreso si existe
        progreso_file="$bloque_dir/.progreso.tmp"
        if [ -f "$progreso_file" ]; then
            current=$(cat "$progreso_file")
            progreso="${COLOR_INFO}($current/10)${COLOR_RESET}"
        else
            progreso=""
        fi
        
        echo -e "${COLOR_OPTION}[$bloque_num]${COLOR_RESET} ${descripciones[$i]} $estado $progreso"
    done
}

# Función principal
main_menu() {
    while true; do
        show_header
        show_blocks
        
        echo -e ""
        echo -e "${COLOR_INFO}Opciones adicionales:${COLOR_RESET}"
        echo -e "${COLOR_OPTION}[L]${COLOR_RESET} Modo libre (acceso sin restricciones)"
        echo -e "${COLOR_OPTION}[S]${COLOR_RESET} Salir del programa"
        echo -e ""
        
        read -p "Selecciona un bloque [1-10], L para modo libre, o S para salir: " opcion
        
        # Salir si el usuario presiona Enter sin opción o selecciona S
        if [[ -z "$opcion" ]] || [[ "$opcion" =~ ^[Ss]$ ]]; then
            echo -e "\n${COLOR_INFO}Hasta luego 👋${COLOR_RESET}"
            exit 0
        fi
        
        # Modo libre
        if [[ "$opcion" =~ ^[Ll]$ ]]; then
            libre_mode
            continue
        fi
        
        # Validar que es un número entre 1 y 10
        if ! [[ "$opcion" =~ ^[1-9]$|^10$ ]]; then
            echo -e "\n${COLOR_ERROR}❌ Opción no válida. Intenta nuevamente.${COLOR_RESET}"
            sleep 1.5
            continue
        fi
        
        # Verificar si el bloque está desbloqueado
        bloque_path="bloques/bloque$(printf "%02d" "$opcion")"
        unlock_path="$bloque_path/unlock_code.txt"
        
        if [[ "$opcion" = "1" ]] || [[ -f "$unlock_path" ]]; then
            echo -e "\n${COLOR_SUCCESS}Iniciando Bloque $opcion...${COLOR_RESET}"
            sleep 1
            (cd "$bloque_path" && ./run_bloque.sh)
        else
            echo -e "\n${COLOR_ERROR}🚫 El Bloque $opcion está bloqueado. Termina el anterior primero.${COLOR_RESET}"
            sleep 2
        fi
    done
}

# Modo libre - permite acceder a cualquier bloque
libre_mode() {
    while true; do
        show_header
        echo -e "${COLOR_TITLE}=== 🆓 MODO LIBRE ACTIVADO ==="
        echo -e "${COLOR_RESET}"
        echo -e "Puedes explorar cualquier bloque sin restricciones."
        echo -e "${COLOR_WARNING}⚠️ El progreso no se guarda en este modo.${COLOR_RESET}"
        echo -e ""
        
        for i in $(seq 0 9); do
            bloque_num=$((i+1))
            echo -e "${COLOR_OPTION}[$bloque_num]${COLOR_RESET} ${descripciones[$i]} ${COLOR_SUCCESS}✅ Disponible${COLOR_RESET}"
        done
        
        echo -e ""
        echo -e "${COLOR_OPTION}[B]${COLOR_RESET} Volver al menú principal"
        echo -e ""
        
        read -p "Selecciona un bloque libre [1-10] o B para volver: " libre_opcion
        
        if [[ "$libre_opcion" =~ ^[Bb]$ ]]; then
            return
        elif [[ "$libre_opcion" =~ ^[1-9]$|^10$ ]]; then
            bloque_path="bloques/bloque$(printf "%02d" "$libre_opcion")"
            echo -e "\n${COLOR_SUCCESS}Iniciando Bloque $libre_opcion en modo libre...${COLOR_RESET}"
            sleep 1
            (cd "$bloque_path" && ./run_bloque.sh --libre)
            read -p "Pulsa ENTER para volver al modo libre..."
        else
            echo -e "\n${COLOR_ERROR}❌ Opción inválida. Intenta de nuevo.${COLOR_RESET}"
            sleep 1.5
        fi
    done
}

# Iniciar el menú principal
main_menu