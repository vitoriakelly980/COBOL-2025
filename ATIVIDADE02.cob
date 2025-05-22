       IDENTIFICATION DIVISION.
       PROGRAM-ID. ATIVIDADE02.
      ******************************************************************
      * Autor: VITORIA KELLY
      * Data: 08-05-2025
      * Assunto: CALCULO IMC
      ******************************************************************

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  WRK-PESO    PIC 9(03)V99   VALUE ZEROS.
       77  WRK-ALTURA  PIC 9(03)V99   VALUE ZEROS.
       77  WRK-IMC     PIC 9(03)V99   VALUE ZEROS.
       77  WRK-IMC2    PIC Z.Z9,99    VALUE ZEROS.

       PROCEDURE DIVISION.
       0100-RECEBER.
           DISPLAY "DIGITE O PESO "
           ACCEPT WRK-PESO.

           DISPLAY "DIGITE A ALTURA "
           ACCEPT WRK-ALTURA.

       0200-CALCULAR.
           COMPUTE WRK-IMC = WRK-PESO / (WRK-ALTURA * WRK-ALTURA).
           MOVE WRK-IMC TO WRK-IMC2.

       0300-MOSTRAR.

           DISPLAY "SEU IMC "  WRK-IMC2.

       0400-FINALIZAR     SECTION.
            STOP RUN.
