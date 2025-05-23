       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGRAM14.
      ******************************************************************
      * Autor: VITORIA KELLY
      * Data:
      * Assunto: TIMES - PERFORM - CONTADOR - UNTIL - VARYING
      ******************************************************************

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  WRK-NUMERO     PIC 9(02) VALUE ZEROS.
       77  WRK-RESULTADO  PIC 9(03) VALUE ZEROS.
       77  WRK-RESULTADO2 PIC ZZ.99 VALUE ZEROS.
       77  WRK-CONTADOR  PIC 9(02)  VALUE 1.

       PROCEDURE DIVISION.
       0001-PRINCIPAL                   SECTION.

           PERFORM 0100-INICIALIZAR
           PERFORM 0200-PROCESSAR
           PERFORM 0300-FINALIZAR
           STOP RUN.

       0100-INICIALIZAR                 SECTION.

           DISPLAY "QUAL NUMERO "
           ACCEPT WRK-NUMERO.

       0200-PROCESSAR                   SECTION.

      *****============++++++UNTIL=====================================
      *****PERFORM UNTIL WRK-CONTADOR GREATER 10
      *****COMPUTE WRK-RESULTADO = WRK-NUMERO * WRK-CONTADOR
      *****MOVE WRK-RESULTADO TO WRK-RESULTADO2
      *****DISPLAY WRK-NUMERO " X " WRK-CONTADOR " = " WRK-RESULTADO2
      *****ADD 1 TO WRK-CONTADOR
      *****END-PERFORM.

      *****==============TIMES==========================================
      *****PERFORM 10 TIMES
      *****COMPUTE WRK-RESULTADO = WRK-NUMERO * WRK-CONTADOR
      *****MOVE WRK-RESULTADO TO WRK-RESULTADO2
      *****DISPLAY WRK-NUMERO " X " WRK-CONTADOR " = " WRK-RESULTADO2
      *****ADD 1 TO WRK-CONTADOR
      *****END-PERFORM.

           PERFORM VARYING WRK-CONTADOR FROM 10 BY 2
               UNTIL WRK-CONTADOR GREATER 20

           COMPUTE WRK-RESULTADO = WRK-NUMERO * WRK-CONTADOR
           MOVE WRK-RESULTADO TO WRK-RESULTADO2
           DISPLAY WRK-NUMERO " X " WRK-CONTADOR " = " WRK-RESULTADO2

           END-PERFORM.

       0300-FINALIZAR                    SECTION.

           DISPLAY "FIM DE PROGRAMA ".
