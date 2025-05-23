       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGRAM13.
      ******************************************************************
      * Autor: VITORIA KELLY
      * Data:
      * Assunto: EVALUATE
      ******************************************************************

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  WRK-NOTA1  PIC 9(04)V99 VALUE ZEROS.
       77  WRK-NOTA2  PIC 9(04)V99 VALUE ZEROS.
       77  WRK-MEDIA  PIC 9(04)V99 VALUE ZEROS.
       77  WRK-MEDIA2 PIC Z.ZZZ,99 VALUE ZEROS.

       PROCEDURE DIVISION.
       0001-PRINCIPAL                   SECTION.

           PERFORM 0100-INICIALIZAR
           PERFORM 0200-PROCESSAR
           PERFORM 0300-FINALIZAR
           STOP RUN.

       0100-INICIALIZAR                 SECTION.

           DISPLAY "DIGITE A NOTA 1 : "
           ACCEPT WRK-NOTA1.

           DISPLAY "DIGITE A NOTA 2 : "
           ACCEPT WRK-NOTA2.

       0200-PROCESSAR                   SECTION.

           COMPUTE WRK-MEDIA = (WRK-NOTA1 + WRK-NOTA2) / 2.
           MOVE WRK-MEDIA TO WRK-MEDIA2.


           EVALUATE TRUE
              WHEN WRK-MEDIA2 GREATER 10
              DISPLAY "ENTRE COM NOTAS CORRETAS "

              WHEN WRK-MEDIA2 GREATER 6
              DISPLAY "APROVADO "

              WHEN OTHER
              DISPLAY "REPROVADO "

           END-EVALUATE.
           PERFORM 0100-INICIALIZAR.

       0300-FINALIZAR                    SECTION.

           DISPLAY "FIM DE PROGRAMA".
