       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGRAM14.
      ******************************************************************
      * Autor: VITORIA KELLY
      * Data:
      * Assunto: ATIVIDADE 4 - PAGAMENTO DE CONTAS.
      ******************************************************************

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

      *====== variaveis de mascara =========
       77  WRK-SALDO2           PIC ZZ.ZZZ,99 VALUE ZEROS.
       77  WRK-TOTALPAGAMENTOS2 PIC ZZ.ZZZ,99 VALUE ZEROS.
       77  WRK-SALDOFINAL2      PIC ZZ.ZZZ,99 VALUE ZEROS.

      *====== variaveis de entrada =========
       77  WRK-SALDO           PIC 9(05)V99  VALUE ZEROS.
       77  WRK-PAGAMENTOS      PIC 9(05)V99  VALUE ZEROS.

      *====== variaveis de processamento ===
       77  WRK-TOTALPAGAMENTOS PIC 9(05)V99  VALUE ZEROS.
       77  WRK-SALDOFINAL      PIC 9(05)V99  VALUE ZEROS.

       PROCEDURE DIVISION.
       0001-PRINCIPAL                   SECTION.

           PERFORM 0100-INICIALIZAR
           PERFORM 0200-PROCESSAR
           PERFORM 0300-FINALIZAR
           STOP RUN.

       0100-INICIALIZAR                 SECTION.

           DISPLAY "INFORME O SALDO INICIAL : "
           ACCEPT WRK-SALDO.


       0200-PROCESSAR                   SECTION.

           DISPLAY "DIGITE UM PAGAMENTO (0) PARA FINALIZAR"
           ACCEPT WRK-PAGAMENTOS
           PERFORM UNTIL WRK-PAGAMENTOS EQUAL 0

                 IF WRK-PAGAMENTOS NOT = 0
                   ADD WRK-PAGAMENTOS TO WRK-TOTALPAGAMENTOS
                   DISPLAY "DIGITE UM PAGAMENTO (0) PARA FINALIZAR"
                   ACCEPT WRK-PAGAMENTOS
                 END-IF

           END-PERFORM.

           COMPUTE WRK-SALDOFINAL = WRK-SALDO - WRK-TOTALPAGAMENTOS.

           MOVE WRK-SALDO                TO WRK-SALDO2.
           MOVE WRK-TOTALPAGAMENTOS      TO WRK-TOTALPAGAMENTOS2.
           MOVE WRK-SALDOFINAL           TO WRK-SALDOFINAL2.

       0300-FINALIZAR                    SECTION.

           DISPLAY "SALDO INICIAL : " WRK-SALDO2.
           DISPLAY "PAGAMENTOS    : " WRK-TOTALPAGAMENTOS2.
           DISPLAY "SALDO FINAL   : " WRK-SALDOFINAL2.
