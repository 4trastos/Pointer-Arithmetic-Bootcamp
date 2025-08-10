#!/bin/bash

# Configuración inicial
# ----------------------------------------------------------------
ALLOW_SKIPPING=false
[[ "$1" == "--libre" ]] && ALLOW_SKIPPING=true

# Colores para mejor visualización
COLOR_RESET="\033[0m"
COLOR_TITLE="\033[1;36m"
COLOR_SUCCESS="\033[1;32m"
COLOR_ERROR="\033[1;31m"
COLOR_WARNING="\033[1;33m"
COLOR_INFO="\033[1;34m"

# Directorios base
SCRIPT_DIR=$(dirname "$0")
ENUNCIADOS_DIR="$SCRIPT_DIR/enunciados"
SOLUCIONES_DIR="$SCRIPT_DIR/soluciones"
TESTS_DIR="$SCRIPT_DIR/tests"

# --- Validación inicial de directorios ---
# ----------------------------------------------------------------
validate_directories() {
    local missing_dirs=()
    
    [[ ! -d "$ENUNCIADOS_DIR" ]] && missing_dirs+=("enunciados")
    [[ ! -d "$SOLUCIONES_DIR" ]] && missing_dirs+=("soluciones")
    [[ ! -d "$TESTS_DIR" ]] && missing_dirs+=("tests")
    
    if [[ ${#missing_dirs[@]} -gt 0 ]]; then
        echo -e "${COLOR_ERROR}❌ Error: Faltan directorios necesarios:${COLOR_RESET}"
        for dir in "${missing_dirs[@]}"; do
            echo -e " - $dir"
        done
        echo -e "\nPor favor, crea los directorios faltantes."
        exit 1
    fi
}

# --- Mostrar enunciado con formato ---
# ----------------------------------------------------------------
show_enunciado() {
    local exercise_num=$1
    local enunciado_file="$ENUNCIADOS_DIR/ejercicio_${exercise_num}.txt"
    
    echo -e "\n${COLOR_TITLE}ENUNCIADO DEL EJERCICIO:${COLOR_RESET}"
    echo "----------------------------------------"
    
    if [[ -f "$enunciado_file" ]]; then
        cat "$enunciado_file"
    else
        echo -e "${COLOR_WARNING}No se encontró el enunciado para este ejercicio.${COLOR_RESET}"
    fi
    
    echo "----------------------------------------"
}

# --- Mostrar menú de opciones ---
# ----------------------------------------------------------------
show_menu() {
    echo -e "\n${COLOR_INFO}OPCIONES:${COLOR_RESET}"
    echo -e "1. ${COLOR_INFO}[Enter]${COLOR_RESET} - Realizar el ejercicio"
    echo -e "2. ${COLOR_INFO}s${COLOR_RESET} - Salir y volver al menú principal"
    if $ALLOW_SKIPPING; then
        echo -e "3. ${COLOR_INFO}n${COLOR_RESET} - Saltar al siguiente ejercicio (modo libre)"
    fi
}

# --- Crear archivo de solución si no existe ---
# ----------------------------------------------------------------
create_solution_file() {
    local exercise_num=$1
    local solution_file="$SOLUCIONES_DIR/ejercicio_${exercise_num}.c"
    
    if [[ ! -f "$solution_file" ]]; then
        mkdir -p "$SOLUCIONES_DIR"
        cat > "$solution_file" <<EOF
/*
 * Ejercicio $exercise_num - Pointer Arithmetic Bootcamp
 * 
 * Instrucciones:
$(cat "$ENUNCIADOS_DIR/ejercicio_${exercise_num}.txt" 2>/dev/null | sed 's/^/ * /' || echo " * Completa este ejercicio según lo indicado")
 */

#include <stdio.h>
#include <stdlib.h>

int main() {
    // Implementa tu solución aquí
    return 0;
}
EOF
    fi
}

# --- Bucle principal para los ejercicios ---
# ----------------------------------------------------------------
main_loop() {
    local i=1
    local exercise_num
    
    while [[ $i -le 10 ]]; do
        exercise_num=$(printf "%02d" $i)
        
        clear
        echo -e "${COLOR_TITLE}=================================================${COLOR_RESET}"
        echo -e "${COLOR_TITLE}  BLOQUE: ARITMÉTICA DE PUNTEROS - EJERCICIO $exercise_num${COLOR_RESET}"
        echo -e "${COLOR_TITLE}=================================================${COLOR_RESET}"
        
        show_enunciado "$exercise_num"
        show_menu
        
        read -p "Selecciona una opción: " option
        
        case "$option" in
            s|S)
                echo -e "\n${COLOR_INFO}Volviendo al menú principal...${COLOR_RESET}"
                sleep 1
                return 1
                ;;
            n|N)
                if $ALLOW_SKIPPING; then
                    echo -e "\n${COLOR_WARNING}Saltando al siguiente ejercicio...${COLOR_RESET}"
                    ((i++))
                    continue
                fi
                ;;
            "")
                ;;
            *)
                echo -e "\n${COLOR_ERROR}Opción no válida. Intenta nuevamente.${COLOR_RESET}"
                sleep 1
                continue
                ;;
        esac
        
        create_solution_file "$exercise_num"
        
        # Abrir editor
        ${EDITOR:-vim} "$SOLUCIONES_DIR/ejercicio_${exercise_num}.c"
        
        # Compilar y ejecutar
        echo -e "\n${COLOR_INFO}--- Verificando tu solución ---${COLOR_RESET}"
        
        if gcc -Wall -Wextra -Werror -g \
           "$SOLUCIONES_DIR/ejercicio_${exercise_num}.c" \
           "$TESTS_DIR/test_${exercise_num}.c" \
           -o test_exec; then
            
            if ./test_exec; then
                echo -e "\n${COLOR_SUCCESS}✅ Ejercicio $exercise_num completado correctamente!${COLOR_RESET}"
                rm -f test_exec
                ((i++))
            else
                echo -e "\n${COLOR_ERROR}❌ Falló el test del ejercicio $exercise_num.${COLOR_RESET}"
                rm -f test_exec
                if ! $ALLOW_SKIPPING; then
                    read -p "Presiona Enter para reintentar..."
                    continue
                fi
            fi
        else
            echo -e "\n${COLOR_ERROR}❌ Error de compilación. Revisa tu código.${COLOR_RESET}"
            if ! $ALLOW_SKIPPING; then
                read -p "Presiona Enter para corregir..."
                continue
            fi
        fi
        
        if ! $ALLOW_SKIPPING; then
            read -p "Presiona Enter para continuar al siguiente ejercicio..."
        else
            sleep 1
        fi
    done
    
    return 0
}

# --- Ejecución principal ---
# ----------------------------------------------------------------
validate_directories

if main_loop; then
    echo -e "\n${COLOR_SUCCESS}🎉 ¡Felicidades! Has completado este bloque.${COLOR_RESET}"
    echo -e "${COLOR_INFO}Volviendo al menú principal...${COLOR_RESET}"
    sleep 2
fi

# Limpieza final
rm -f test_exec