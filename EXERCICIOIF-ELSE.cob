       IDENTIFICATION DIVISION.
       PROGRAM-ID. EXERCICIOIF-ELSE.
      ******************************************************************
      * Author: VITORIA
      * Date: 12/03/2024
      * Purpose: EXEMPLO DE IF E ELSE COM PRODUTOS.
      * Comments:
      ******************************************************************
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  WRK-VALORPRODUTO1    PIC 9(04)V99 VALUE ZEROS.
       77  WRK-VALORPRODUTO2    PIC 9(04)V99 VALUE ZEROS.
       77  WRK-FRETE            PIC 9(08)V99 VALUE ZEROS.
       77  WRK-FRETE-ED         PIC ZZ.ZZZ.ZZ9,99 VALUE ZEROS.

       PROCEDURE DIVISION.
       0100-RECEBE         SECTION.
           DISPLAY "DIGITE O VALOR DO PRODUTO1"
             ACCEPT WRK-VALORPRODUTO1

           DISPLAY "DIGITE O VALOR DO PRODUTO2"
             ACCEPT WRK-VALORPRODUTO2.

       0150-PROCESSA        SECTION.
           COMPUTE WRK-FRETE = WRK-VALORPRODUTO1 + WRK-VALORPRODUTO2.

       0200-MOSTRA         SECTION.
           MOVE WRK-FRETE TO WRK-FRETE-ED
           DISPLAY "VALOR TOTAL..." WRK-FRETE-ED.
           IF WRK-FRETE-ED GREATER 1000
               DISPLAY "FRETE GRÁTIS"
           ELSE
               DISPLAY "RETIRADA NA LOJA".
       0300-FINALIZA       SECTION.
                    STOP RUN.
