       IDENTIFICATION DIVISION.
       PROGRAM-ID. OPERADORES.
      ******************************************************************
      * Author: VITORIA
      * Date: 09/03/2024
      * Purpose: EXEMPLO DE TODOS OPERADORES
      * Comments:
      ******************************************************************
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77 WRK-NUM1         PIC 9(04)        VALUE ZEROS.
       77 WRK-NUM2         PIC 9(04)        VALUE ZEROS.
       77 WRK-RESULTADO    PIC 9(08)V99     VALUE ZEROS.
       77 WRK-RESULTADO-ED PIC ZZ.ZZZ.ZZ9,99  VALUE ZEROS.

       PROCEDURE DIVISION.
       0100-RECEBE         SECTION.

            DISPLAY "ENTRE COM O NUMERO 1"
            ACCEPT WRK-NUM1

            DISPLAY "ENTRE COM O NUMERO 2"
            ACCEPT WRK-NUM2.

       0150-PROCESSA        SECTION.
      *-----------MULTIPLY
             MULTIPLY WRK-NUM1 BY WRK-NUM2 GIVING WRK-RESULTADO.

      *-----------ADD
      *      ADD WRK-NUM1 WRK-NUM2 TO WRK-RESULTADO

      *-----------SUBTRACT
      *      SUBTRACT WRK-NUM1 FROM WRK-NUM2 GIVING WRK-RESULTADO

      *-----------DIVIDE
      *      DIVIDE WRK-NUM1 BY WRK-NUM2 GIVING WRK-RESULTADO

       0200-MOSTRA         SECTION.
            MOVE WRK-RESULTADO TO WRK-RESULTADO-ED
            DISPLAY "RESULTADO..." WRK-RESULTADO-ED.

       0300-FINALIZA       SECTION.
                    STOP RUN.
