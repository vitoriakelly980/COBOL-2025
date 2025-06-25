       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGRAM05.
      ******************************************************************
      * Autor: VITORIA KELLY
      * Data:
      * Assunto: VARIAVEL DE NIVEL ESTRUTURAL 1
      ******************************************************************

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  WRK-DATA PIC X(08) VALUE ZEROS.

       PROCEDURE DIVISION.
       0100-RECEBER.
           ACCEPT WRK-DATA FROM DATE YYYYMMDD.

       0200-CALCULAR.

       0300-MOSTRAR.
           DISPLAY "DATA INTEIRA " WRK-DATA.
           DISPLAY "DIA " WRK-DATA(07:02) DISPLAY "MES" WRK-DATA (05:02)
           "ANO " WRK-DATA (01:04).

       0400-FINALIZAR     SECTION.

            STOP RUN.
