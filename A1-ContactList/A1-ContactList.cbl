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
      *
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
           record contains 62 characters.
      * Declare variable to write to for out file
       01 output-line              pic X(62).
      *
       working-storage section.
      * Declare heading for file with space (filler) on each side
       01 ws-heading.
         05 filler                     pic X(20)
                   value spaces.
         05 ws-heading-title           pic X(22)
                   value "MAFD 4202 Contact List".
         05 filler                     pic X(20)
                   value spaces.
      * Declare contact details
       01 ws-contact.
         05 ws-name                    pic X(20).
         05 ws-email                   pic X(30).
         05 ws-phone-number            pic X(12).
      * Declare message for console window
       01 ws-accept-message            pic X(50).
      *
       procedure division.
       000-main.
      * Opening the connection to output file and writing to it
           open output output-file.
      * Display header and add spaces in between records
           write output-line from ws-heading after advancing 1 line.
      * Assign values to previously declared variables
           move "Gaelen Rhoads"                to ws-name.
           move "gaelen.rhoads@dcmail.ca"      to ws-email.
           move "203-393-5200"                 to ws-phone-number.
      * Write the contact to the file and add space
           write output-line from ws-contact after advancing 2 lines.
      * Reassign variables for next contact
           move "Marcus Chadwick"              to ws-name.
           move "marcus.chadwick@dcmail.ca"    to ws-email.
           move "203-412-3748"                 to ws-phone-number.
      * Write new contact to file with space
           write output-line from ws-contact.
      * Reassign information for last contact
           move "John Smith"                   to ws-name.
           move "john.smith@dcmail.ca"         to ws-email.
           move "203-393-5200"                 to ws-phone-number.
      * Write last contact to file
           write output-line from ws-contact.
      * Assign console output to variable
           move "Press the enter key to exit the program..."
                                               to ws-accept-message.
      * Display instructions to user to close console window
           display ws-accept-message.
           accept ws-accept-message.
      * Close output file and end program
           close output-file
           goback.
       end program A1-ContactList.