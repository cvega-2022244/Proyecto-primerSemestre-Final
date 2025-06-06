# Calculadora (PSeInt)

![Status](https://img.shields.io/badge/status-ready-brightgreen)
![License](https://img.shields.io/badge/license-MIT-blue)

Proyecto final de la asignatura **Introduccion a los Sistemas de computo** – 2025  
Repositorio público con el código fuente y la documentación completa (usuario y técnica).

---

## Tabla de Contenido
1. [Descripción general](#descripción-general)
2. [Características principales](#características-principales)
3. [Requisitos](#requisitos)


---

## Descripción general
Esta **calculadora de consola** escrita en PSeInt agrupa once utilidades:

| Categoría | Opción | Descripción breve |
|-----------|--------|-------------------|
| Operaciones | 1 – 4 | Suma, resta, multiplicación y división (con validación de divisor ≠ 0). |
| Matrices    | 5 – 8 | Sumar/restar todos los valores de **una** matriz o sumar/restar **dos** matrices del mismo tamaño. |
| Figuras     | 9 – 10 | Triángulo de números impares y rectángulo hueco de asteriscos. |
| Estadísticas| 11 | Suma, promedio, mayor, menor y conteos de una lista de hasta 100 números. |

Todo se controla mediante un menú simple, pensado para practicar estructuras de control y subprocesos.

---

## Características principales
- **Menú interactivo** con validación de entrada (solo 0-11).
- **Subprocesos modulares**: cada opción vive en su propia rutina.
- **Entradas validadas** (tamaños de matriz, divisor distinto de cero, lista ≤ 100 números).
- **Documentación completa** (manual de usuario + manual técnico en `/docs`).
- **Diagrama de bloques** para visualizar la arquitectura.

---

## Requisitos
| Software / Hardware | Mínimo | Notas |
|---------------------|--------|-------|
| PSeInt | 2023-04 | Perfil de idioma: Español |
| CPU | 1 GHz | x86/x64 |
| RAM | 2 GB | Uso muy ligero |
| SO | Windows / Linux / macOS | Cualquiera que ejecute PSeInt |
| Git (opcional) | 2.x | Clonar/actualizar el repo |

---

