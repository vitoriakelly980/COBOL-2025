      ******************************************************************
      * AUTOR: VITORIA KELLY
      * ASSUNTO: VETORES - REDEFINES - FILLER (MESES
      ******************************************************************

       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGRAMA16.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
      *****== vetores (data atual)=========
       01  WRK-DATA.
           05 WRK-ANO PIC 9(04) .
           05 WRK-MES PIC 9(02) .
           05 WRK-DIA PIC 9(02) .
      *****== variaveis de memoria (mes por extenso)====
       01  TABELA-DE-MESES.
            05 FILLER PIC X(09) VALUES "JANEIRO".
            05 FILLER PIC X(09) VALUES "FEVEREIRO".
            05 FILLER PIC X(09) VALUES "MARCO".
            05 FILLER PIC X(09) VALUES "ABRIL".
            05 FILLER PIC X(09) VALUES "MAIO".
            05 FILLER PIC X(09) VALUES "JUNHO".
            05 FILLER PIC X(09) VALUES "JULHO".
            05 FILLER PIC X(09) VALUES "AGOSTO".
            05 FILLER PIC X(09) VALUES "SETEMBRO".
            05 FILLER PIC X(09) VALUES "OUTUBRO".
            05 FILLER PIC X(09) VALUES "NOVEMBRO".
            05 FILLER PIC X(09) VALUES "DEZEMBRO".
       01  TABELA-DE-MESES-R REDEFINES TABELA-DE-MESES OCCURS 12 TIMES.
           03 MESES   PIC X(09).

       PROCEDURE DIVISION.
       0001-PRINCIPAL              SECTION.

           PERFORM 0100-INICIALIZAR
           PERFORM 0200-PROCESSAR
           PERFORM 0300-FINALIZAR
           STOP RUN.

       0100-INICIALIZAR            SECTION.

           ACCEPT WRK-DATA FROM DATE  YYYYMMDD.

       0200-PROCESSAR              SECTION.

           DISPLAY "----- DATA ATUALIZADA ----- "
           DISPLAY WRK-DIA " DE " MESES(WRK-MES)" DE " WRK-ANO.

       0300-FINALIZAR              SECTION.

           DISPLAY "FIM DE PROGRAMA."
