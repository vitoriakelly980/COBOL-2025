       IDENTIFICATION DIVISION.
       PROGRAM-ID. CLIENTES.
      ******************************************************************
      *OBJETIVO: SISTEMA DE GEST�O DE CLIENTES
      *AUTHOR  : VITORIA KELLY
      ******************************************************************
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
      *****informando onde o arquivo est�
           SELECT CLIENTES ASSIGN TO
           "C:\CURSOCOBOL\COBOL 2025\DADOS\CLIENTES.DAT.TXT"
      *****organiza�ao do arquivo ser� indexada
               ORGANIZATION    IS INDEXED
      *****ordem por procura
               ACCESS MODE     IS DYNAMIC
               FILE STATUS     IS CLIENTES-STATUS
               RECORD KEY      IS CLIENTES-CHAVE.

           SELECT RELATO ASSIGN TO
           "C:\CURSOCOBOL\COBOL 2025\DADOS\CLIENTES.DAT.TXT"
           ORGANIZATION IS SEQUENTIAL.

       DATA DIVISION.
       FILE            SECTION.
       FD  CLIENTES.
       01  CLIENTES-REG.
           05 CLIENTES-CHAVE.
              10 CLIENTES-FONE          PIC 9(12).
           05 CLIENTES-NOME             PIC X(09).
           05 CLIENTES-EMAIL            PIC X(30).

       FD  RELATO.
       01  RELATO-REG.
           05 RELATO-DADOS PIC X(79).


       WORKING-STORAGE SECTION.
       77  WRK-OPCAO                    PIC X(01).
       77  WRK-MODULO                   PIC X(25).
       77  WRK-TECLA                    PIC X(01).
       77  CLIENTES-STATUS              PIC 9(02).
       77  WRK-MSGERRO                  PIC X(30).
       77  WRK-CONTALINHA               PIC 9(03) VALUE 0.
       77  WRK-QTREGISTRO               PIC 9(05) VALUE 0.

       SCREEN SECTION.
       01  TELA.
           05 LIMPA-TELA.
              10 BLANK SCREEN.
              10 LINE 01 COLUMN 01 PIC X(20) ERASE EOL
                 BACKGROUND-COLOR 2.
              10 LINE 1 COLUMN 50 PIC X(20)
                 BACKGROUND-COLOR 2 FOREGROUND-COLOR 4
                   FROM 'SISTEMA DE CLIENTES'.
              10 LINE 02 COLUMN 1 PIC X(25) ERASE EOL
                 BACKGROUND-COLOR 1 FROM WRK-MODULO.

       01  MENU.
           05 LINE 07 COLUMN 15 VALUE '1 - INCLUIR'.
           05 LINE 08 COLUMN 15 VALUE '2 - 1CONSULTA'.
           05 LINE 09 COLUMN 15 VALUE '3 - ALTERAR'.
           05 LINE 10 COLUMN 15 VALUE '4 - EXCLUIR'.
           05 LINE 11 COLUMN 15 VALUE '5 - RELATORIO EM TELA'.
           05 LINE 12 COLUMN 15 VALUE '6 - RELATORIO EM DISCO'.
           05 LINE 13 COLUMN 15 VALUE 'X - SAIDA'.
           05 LINE 14 COLUMN 15 VALUE 'OPCAO:'.
           05 LINE 14 COLUMN 23 USING WRK-OPCAO.

       01  TELA-REGISTRO.
           05 CHAVE FOREGROUND-COLOR 2.
              10 LINE 10 COLUMN 10 VALUE 'TELEFONE'.
              10 COLUMN PLUS 2 PIC 9(11) USING CLIENTES-FONE
                 BLANK WHEN ZEROS.
           05 SS-DADOS.
              10 LINE 11 COLUMN 10 VALUE 'NOME:.....'.
              10 COLUMN PLUS 2 PIC X(09) USING CLIENTES-NOME.
              10 LINE 12 COLUMN 10 VALUE 'EMAIL:.....'.
              10 COLUMN PLUS 2 PIC X(30) USING CLIENTES-EMAIL.

       01  MOSTRA-ERRO.
           02 MSG-ERRO.
           10 LINE 16 COLUMN 01 ERASE EOL
                      BACKGROUND-COLOR 4.
           10 LINE 16 COLUMN 10 PIC X(30)
                 BACKGROUND-COLOR 4
                 FROM WRK-MSGERRO.
           10 COLUMN PLUS 2 PIC X(01) USING WRK-TECLA.

       PROCEDURE DIVISION.
       0001-PRINCIPAL SECTION.
           PERFORM 1000-INICIAR THRU 1100-MONTATELA.
           PERFORM 2000-PROCESSAR UNTIL WRK-OPCAO = 'X'.
           PERFORM 3000-FINALIZAR.
           STOP RUN.

       1000-INICIAR.

           OPEN I-O CLIENTES
           IF CLIENTES-STATUS EQUAL 35 THEN
               OPEN OUTPUT CLIENTES
               CLOSE CLIENTES
               OPEN I-O CLIENTES
           END-IF.

       1100-MONTATELA.

           DISPLAY TELA.
           ACCEPT MENU.

       2000-PROCESSAR.

           MOVE SPACES TO CLIENTES-NOME CLIENTES-EMAIL WRK-MSGERRO.

           EVALUATE WRK-OPCAO
           WHEN 1
             PERFORM 5000-INCLUIR
           WHEN 2
             PERFORM 6000-CONSULTAR
           WHEN 3
             PERFORM 7000-ALTERAR
           WHEN 4
             PERFORM 8000-EXCLUIR
           WHEN 5
             PERFORM 9000-RELATORIOTELA
           WHEN 6
             PERFORM 9100-RELATORIODISCO
           WHEN OTHER
             IF WRK-OPCAO NOT EQUAL "X"
                DISPLAY "ENTRE COM A OPCAO CORRETA "
             END-IF
           END-EVALUATE.

           PERFORM 1100-MONTATELA.

       3000-FINALIZAR.
           CLOSE CLIENTES.

       5000-INCLUIR.
           MOVE 'MODULO - INCLUSAO ' TO WRK-MODULO.
           DISPLAY TELA.
            ACCEPT TELA-REGISTRO.
           WRITE CLIENTES-REG
              INVALID KEY
           MOVE 'JA EXISTE ' TO WRK-MSGERRO
           ACCEPT MOSTRA-ERRO
           END-WRITE.

       6000-CONSULTAR.
           MOVE 'MODULO - CONSULTA ' TO WRK-MODULO.
           DISPLAY TELA.
            DISPLAY TELA-REGISTRO.
             ACCEPT CHAVE.
              READ CLIENTES
               INVALID KEY
           MOVE 'NAO ENCONTRADO' TO WRK-MSGERRO
               NOT INVALID KEY
           MOVE '---- ENCONTRADO ----- ' TO WRK-MSGERRO
                 DISPLAY SS-DADOS
               END-READ.
              ACCEPT MOSTRA-ERRO.

       8000-EXCLUIR.
           MOVE 'MODULO - EXCLUSAO ' TO WRK-MODULO.
           DISPLAY TELA.
             DISPLAY TELA-REGISTRO.
               ACCEPT CHAVE.
                READ CLIENTES
                 INVALID KEY
             MOVE 'NAO ENCONTRADO ' TO WRK-MSGERRO
                   NOT INVALID KEY
             MOVE 'ENCONTRADO (S / N ? ) ' TO WRK-MSGERRO
           DISPLAY SS-DADOS
           END-READ.

                 ACCEPT MOSTRA-ERRO.
           IF WRK-TECLA = 'S' AND CLIENTES-STATUS = 0
               DELETE CLIENTES
                 INVALID KEY
                  MOVE 'NAO EXCLUIDO ' TO WRK-MSGERRO
               ACCEPT MOSTRA-ERRO
             END-DELETE
           END-IF.

       7000-ALTERAR.
           MOVE 'MODULO - ALTERAR ' TO WRK-MODULO.
           DISPLAY TELA.
           DISPLAY TELA-REGISTRO.
            ACCEPT CHAVE.
             READ CLIENTES
              IF CLIENTES-STATUS EQUAL 0
                ACCEPT SS-DADOS
              REWRITE CLIENTES-REG
             IF CLIENTES-STATUS EQUAL 0
              MOVE 'REGISTRO ALTERADO ' TO WRK-MSGERRO
                ACCEPT MOSTRA-ERRO
             ELSE
              MOVE 'REGISTRO NAO ALTERADO ' TO WRK-MSGERRO
                ACCEPT MOSTRA-ERRO
                  END-IF
             ELSE
              MOVE 'REGISTRO NAO ENCONTRADO ' TO WRK-MSGERRO
                 ACCEPT MOSTRA-ERRO
             END-IF.

       9000-RELATORIOTELA.

           MOVE 'MODULO - RELATORIO ' TO WRK-MODULO.
           DISPLAY TELA.
            MOVE 11989340547 TO CLIENTES-FONE.
           START CLIENTES KEY IS EQUAL CLIENTES-FONE.
           READ CLIENTES
            INVALID KEY
             MOVE 'NENHUM REGISTRO ENCONTRADO ' TO WRK-MSGERRO
            NOT INVALID KEY
             DISPLAY 'RELATORIO DE CLIENTES '
             DISPLAY '----------------------'
             PERFORM UNTIL CLIENTES-STATUS = 20
              ADD 1 TO WRK-QTREGISTRO
             DISPLAY CLIENTES-FONE   ' '
                     CLIENTES-NOME   ' '
                     CLIENTES-EMAIL
                 READ CLIENTES NEXT
             ADD 1 TO WRK-CONTALINHA
              IF WRK-CONTALINHA = 10
                  MOVE 'PRESSIONE ALGUMA TECLA' TO WRK-MSGERRO

           MOVE 'MODULO - RELATORIO ' TO WRK-MODULO
           DISPLAY TELA
              DISPLAY 'RELATORIO DE CLIENTES '
              DISPLAY '----------------------'
              MOVE 0 TO WRK-CONTALINHA
             END-IF
             END-PERFORM
                 END-READ.
             MOVE 'REGISTROS LIDOS' TO WRK-MSGERRO.

             MOVE WRK-QTREGISTRO TO WRK-MSGERRO(17:05).

             ACCEPT MOSTRA-ERRO.

       9100-RELATORIODISCO.

           MOVE 'MODULO - RELATORIO ' TO WRK-MODULO.
           DISPLAY TELA.
            MOVE 11989340547 TO CLIENTES-FONE.
           START CLIENTES KEY EQUAL CLIENTES-FONE.
           READ CLIENTES
            INVALID KEY
              MOVE 'NENHUM REGISTRO ENCONTRADO ' TO WRK-MSGERRO
                NOT INVALID KEY
                 OPEN OUTPUT RELATO
                 PERFORM UNTIL CLIENTES-STATUS = 10
                  ADD 1 TO WRK-QTREGISTRO
                 MOVE CLIENTES-REG TO RELATO-REG
                     WRITE RELATO-REG
                   READ CLIENTES NEXT
                  END-PERFORM
                MOVE 'REGISTROS LIDOS ' TO WRK-MSGERRO
                 END-READ.
           MOVE 'REGISTROS LIDOS' TO RELATO-REG.
           MOVE WRK-QTREGISTRO TO RELATO-REG (18:05).
             WRITE RELATO-REG
             CLOSE RELATO
           MOVE WRK-QTREGISTRO TO WRK-MSGERRO(17:05).

             ACCEPT MOSTRA-ERRO.
