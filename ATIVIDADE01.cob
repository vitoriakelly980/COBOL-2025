       IDENTIFICATION DIVISION.
       PROGRAM-ID. ATIVIDADE01.
      ******************************************************************
      * Autor: VITORIA KELLY
      * Data: 08-05-2025
      * Assunto: CONVERSÃO DO DOLAR PARA REAL.
      ******************************************************************

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  WRK-DOLAR       PIC 9(03)V99    VALUE ZEROS.
       77  WRK-QUANT-DOLAR PIC 9(03)V99    VALUE ZEROS.
       77  WRK-QUANT2      PIC Z.Z9,99     VALUE ZEROS.
       77  WRK-RESULTADO   PIC 9(03)V99    VALUE ZEROS.
       77  WRK-RESULTADO2  PIC Z.Z9,99     VALUE ZEROS.

       PROCEDURE DIVISION.
       0100-RECEBER.
           DISPLAY "DIGITE O VALOR DO DOLAR ATUAL :"
           ACCEPT WRK-DOLAR.

           DISPLAY "DIGITE A QUANTIDADE DE DOLARES A SER CONVERTIDO :"
           ACCEPT WRK-QUANT-DOLAR.

       0200-CALCULAR.

           COMPUTE WRK-RESULTADO = WRK-DOLAR * WRK-QUANT-DOLAR.
           MOVE WRK-RESULTADO TO WRK-RESULTADO2.
           MOVE WRK-QUANT-DOLAR TO WRK-QUANT2.

       0300-MOSTRAR.

           DISPLAY "CONVERSAO DE " WRK-QUANT2 " DOLARES = "
           WRK-RESULTADO2 " REAIS".

       0400-FINALIZAR     SECTION.
            STOP RUN.
