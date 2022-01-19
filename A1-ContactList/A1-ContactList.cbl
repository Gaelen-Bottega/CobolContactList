       identification division.
       program-id. A1-ContactList.
       author. Gaelen Rhoads.
       date-written. 2022-01-12.
      * Description:
      *    Program to add a list of people to a file.
      *    Information includes name, email and phone
      *    number. 
      *
       environment division.
       configuration section.
      * Deliberately blank
       input-output section.
       file-control.
      *    
      * Creation of name and location of output file
           select output-file
               assign to "../../../../data/A1-ContactList.out"
               organization is line sequential.
      *
       data division.
       file section.
      * Declare how long the output lines will be in our file
       fd output-file
           data record is output-line
           record contains 44 characters.
      *
       01 output-line              pic X(44).
      *
       working-storage section.
       01 ws-heading.
         05 filler                 pic X(12)
                           value spaces.
         05 ws-heading-title       pic X(22)
                           value "MAFD 4202 Contact List".
         05 filler                 pic X(12)
                           value spaces.
      *
       01 ws-accept-message pic X(45).
       
      *
       procedure division.
       000-main.
      *    move "Gaelen" to ws-first.
      *    move "Rhoads" to ws-family.
      *    move "Hello"  to ws-message.
      *    display ws-message ws-first ws-family.
      *
           open output output-file.
           move ws-name to output-line.
           write output-line.
           close output-file.
      *
           move "Press the enter key to exit the program..."
             to ws-accept-message.
      *
           display ws-accept-message.
           accept ws-accept-message.
      * Close output file
           close output-file
           goback.
       end program A1-ContactList.