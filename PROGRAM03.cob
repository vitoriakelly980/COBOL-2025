       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGRAM03.
      ******************************************************************
      * Autor: VITORIA KELLY
      * Data:
      * Assunto: VARIAVEL COM SINAL + MASCARA DE EDIÇÃO (Z)
      ******************************************************************

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  WRK-VALOR1      PIC  9(03)V99     VALUE ZEROS.
       77  WRK-VALOR2      PIC  9(03)V99     VALUE ZEROS.
       77  WRK-RESULTADO   PIC  S9(03)V99    VALUE ZEROS.
       77  WRK-RESULTADO2  PIC  Z.Z9,99      VALUE ZEROS.

       PROCEDURE DIVISION.
       0100-RECEBER.
           DISPLAY "DIGITE O VALOR 1 : "
           ACCEPT WRK-VALOR1.

           DISPLAY "DIGITE O VALOR 2 : "
           ACCEPT WRK-VALOR2.

       0200-CALCULAR.
           COMPUTE WRK-RESULTADO = WRK-VALOR1 - WRK-VALOR2.
           MOVE    WRK-RESULTADO TO WRK-RESULTADO2.

       0300-MOSTRAR.
           DISPLAY "RESULTADO FINAL : " WRK-RESULTADO2.

       0400-FINALIZAR     SECTION.
            STOP RUN.
