Algoritmo Calculadora_Final
    Definir opcion Como Entero   // aquí guardamos lo que eligamos  del menú
    
    Repetir
        Limpiar Pantalla
        // --- Menú principal ---
        Escribir "=============  MENÚ  ============="
        Escribir " 1  Suma"
        Escribir " 2  Resta"
        Escribir " 3  Multiplicación"
        Escribir " 4  División"
        Escribir " 5  Sumar todos los valores de una matriz"
        Escribir " 6  Restar todos los valores de una matriz"
        Escribir " 7  Suma de matrices"
        Escribir " 8  Resta de matrices"
        Escribir " 9  Triángulo con números impares"
        Escribir "10  Rectángulo hueco con asteriscos"
        Escribir "11  Estadísticas de una lista"
        Escribir " 0  Salir"
        Escribir "=================================="
        
        // pedimos la opción hasta que se ponga algo válido
        Repetir
            Escribir Sin Saltar "Elige opción (0-11): " ; Leer opcion
        Hasta Que opcion >= 0 Y opcion <= 11
        
        // según lo que elegimos, llamamos al subproceso
        Segun opcion Hacer
            1:
                OperacionBasica("+")          // suma
            2:
                OperacionBasica("-")          // resta
            3:
                OperacionBasica("*")          // multiplicar
            4:
                OperacionBasica("/")          // dividir
            5:
                UnaMatriz("sumar")            // suma todos los números de UNA matriz
            6:
                UnaMatriz("restar")           // resta secuencial de UNA matriz
            7:
                DosMatrices("sumar")          // A + B
            8:
                DosMatrices("restar")         // A ? B
            9:
                TrianguloImpar()              // dibuja triángulo 
            10:
                RectanguloHueco()             // dibuja rectángulo 
            11:
                EstadisticasLista()           
        FinSegun
        
        // pausa para que se vea el resultado
        Si opcion <> 0 Entonces
            Escribir "" ; Escribir "Pulsa <Enter> para continuar..."
            Esperar Tecla
        FinSi
    Hasta Que opcion = 0
    
    Escribir "Fin del programa. ??"
FinAlgoritmo



// ================================================================
//  SUBPROCESOS (mini-funciones)
// ================================================================


// ---------- Operaciones básicas (+, -, *, /) ----------
SubProceso OperacionBasica(signo)
    Definir a, b, r Como Real
    
    Escribir Sin Saltar "Número 1: " ; Leer a
    
    // si es división, no me deja poner cero
    Si signo = "/" Entonces
        Repetir
            Escribir Sin Saltar "Número 2 (<> 0): " ; Leer b
        Hasta Que b <> 0
    Sino
        Escribir Sin Saltar "Número 2: " ; Leer b
    FinSi
    
    // calculamos por el signo pedido
    Segun signo Hacer
        "+": r <- a + b
        "-": r <- a - b
        "*": r <- a * b
        "/": r <- a / b
    FinSegun
    
    Escribir "Resultado = ", r
FinSubProceso



// ---------- Suma o resta de TODOS los valores de UNA matriz ----------
SubProceso UnaMatriz(accion)        // "sumar" o "restar"
    Definir n, i, j Como Entero
    Definir total Como Real
    
    // primero pedimos qué tan grande es la matriz
    Repetir
        Escribir Sin Saltar "Dimensión de la matriz (1-10): " ; Leer n
    Hasta Que n >= 1 Y n <= 10
    
    Dimension A[n, n]   // creamos la matriz
    
    // ahora llenamos la matriz pidiéndo cada número
    Para i <- 1 Hasta n Hacer
        Para j <- 1 Hasta n Hacer
            Escribir Sin Saltar "A[", i, ",", j, "] = " ; Leer A[i, j]
        FinPara
    FinPara
    
    // calculamos la suma o la resta encadenada
    Si accion = "sumar" Entonces
        total <- 0
        Para i <- 1 Hasta n Hacer
            Para j <- 1 Hasta n Hacer
                total <- total + A[i, j]
            FinPara
        FinPara
        Escribir "Suma total = ", total
    Sino   // acción = "restar"
        total <- A[1, 1]  // arrancamos con el primer número
        Para i <- 1 Hasta n Hacer
            Para j <- 1 Hasta n Hacer
                Si i <> 1 O j <> 1 Entonces
                    total <- total - A[i, j]
                FinSi
            FinPara
        FinPara
        Escribir "Resta secuencial = ", total
    FinSi
FinSubProceso



// ---------- Suma o resta de DOS matrices ----------
SubProceso DosMatrices(accion)      // "sumar" o "restar"
    Definir n, i, j Como Entero
    
    Repetir
        Escribir Sin Saltar "Dimensión de las matrices (1-10): " ; Leer n
    Hasta Que n >= 1 Y n <= 10
    
    Dimension A[n, n], B[n, n], C[n, n]
    
    // llenamos A
    Escribir "----- MATRIZ A -----"
    Para i <- 1 Hasta n Hacer
        Para j <- 1 Hasta n Hacer
            Escribir Sin Saltar "A[", i, ",", j, "] = " ; Leer A[i, j]
        FinPara
    FinPara
    
    // llenamos B
    Escribir "----- MATRIZ B -----"
    Para i <- 1 Hasta n Hacer
        Para j <- 1 Hasta n Hacer
            Escribir Sin Saltar "B[", i, ",", j, "] = " ; Leer B[i, j]
        FinPara
    FinPara
    
    // calculamos C = A ± B
    Para i <- 1 Hasta n Hacer
        Para j <- 1 Hasta n Hacer
            Si accion = "sumar" Entonces
                C[i, j] <- A[i, j] + B[i, j]
            Sino
                C[i, j] <- A[i, j] - B[i, j]
            FinSi
        FinPara
    FinPara
    
    // mostramos la matriz resultado
    Escribir "----- MATRIZ RESULTADO -----"
    Para i <- 1 Hasta n Hacer
        Para j <- 1 Hasta n Hacer
            Escribir Sin Saltar C[i, j], " "
        FinPara
        Escribir ""
    FinPara
FinSubProceso



// ---------- Triángulo con números impares ----------
SubProceso TrianguloImpar
    Definir n, fila, col, valor Como Entero
    
    Repetir
        Escribir Sin Saltar "Altura del triángulo (1-20): " ; Leer n
    Hasta Que n >= 1 Y n <= 20
    
    Para fila <- 1 Hasta n Hacer
        valor <- 2 * fila - 1      // arranco con el numero impar más grande
        Para col <- 1 Hasta fila Hacer
            Escribir Sin Saltar valor, " "
            valor <- valor - 2
        FinPara
        Escribir ""
    FinPara
FinSubProceso



// ---------- Dibujar rectángulo de asteriscos ----------
SubProceso RectanguloHueco
    Definir n, i, j Como Entero
    
    Repetir
        Escribir Sin Saltar "Tamaño del lado (>= 3): " ; Leer n
    Hasta Que n >= 3
    
    Para i <- 1 Hasta n Hacer
        Para j <- 1 Hasta n Hacer
            Si i = 1 O i = n O j = 1 O j = n Entonces
                Escribir Sin Saltar "* "
            Sino
                Escribir Sin Saltar "  "
            FinSi
        FinPara
        Escribir ""
    FinPara
FinSubProceso



// ---------- Estadísticas de hasta 100 números ----------
SubProceso EstadisticasLista
    Dimension L[100]
    Definir c, i Como Entero
    Definir num, suma, prom, mayor, menor Como Real
    Definir arriba, abajo Como Entero
    
    // pedimos los números uno por uno
    c <- 0
    suma <- 0
    Escribir "Ingresa números (-1 termina, máx. 100):"
    Repetir
        Leer num
        Si num <> -1 Entonces
            c <- c + 1
            L[c] <- num
            suma <- suma + num
        FinSi
    Hasta Que num = -1 O c = 100
    
    // se ingreso algo?
    Si c = 0 Entonces
        Escribir "No se ingresaron datos."
    Sino
        // calculamos todo
        prom  <- suma / c
        mayor <- L[1]
        menor <- L[1]
        arriba <- 0
        abajo  <- 0
        
        Para i <- 1 Hasta c Hacer
            Si L[i] > mayor Entonces
                mayor <- L[i]
            FinSi
            Si L[i] < menor Entonces
                menor <- L[i]
            FinSi
            Si L[i] > prom Entonces
                arriba <- arriba + 1
            Sino
                Si L[i] < prom Entonces
                    abajo <- abajo + 1
                FinSi
            FinSi
        FinPara
        
        // y mostramos 
        Escribir "--------- RESULTADOS ---------"
        Escribir "Cantidad de números: ", c
        Escribir "Suma:                ", suma
        Escribir "Promedio:            ", prom
        Escribir "Número mayor:        ", mayor
        Escribir "Número menor:        ", menor
        Escribir "Mayores al promedio: ", arriba
        Escribir "Menores al promedio: ", abajo
    FinSi
FinSubProceso
