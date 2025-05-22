       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGRAM02.
      ******************************************************************
      * Autor: VITORIA KELLY
      * Data:
      * Assunto: VARIAVEL COM CASA DECIMAL
      ******************************************************************

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  WRK-NOME    PIC  X(10)     VALUE SPACES.
       77  WRK-IDADE   PIC  9(03)     VALUE ZEROS.
       77  WRK-SALARIO PIC  9(10)V99  VALUE ZEROS.

       PROCEDURE DIVISION.
            DISPLAY "Digite o nome :"
            ACCEPT WRK-NOME.

            DISPLAY "Digite a idade :"
            ACCEPT WRK-IDADE.

            DISPLAY "Digite o salario :"
            ACCEPT WRK-SALARIO.

            DISPLAY "Nome : " WRK-NOME "Idade :" WRK-IDADE.
            DISPLAY "Salario :" WRK-SALARIO.
            STOP RUN.
