## App homepage: https://cs1632ex.herokuapp.com/

FUN-WELCOME - The homepage shall display the text "CS1632 D3" and below it, "Welcome, friend,\nto a land of pure calculation.\nTHE WORLD IS YOUR OYSTER".  The title shall be "CS1632 D3".

FUN-LINKS - Every page shall include five links at the top, to "CS1632 D3 Home", "Factorial", "Fibonacci", "Hello", and "Cathedral Pics".  These shall link to `/`, `/fact`, `/fib`, `/hello`, and `/cathy`, respectively.

FUN-FACT - The factorial page (`/fact`) shall allow a user to enter a positive integer from 1 to 100, and upon pressing submit, shall show to the user the factorial of the value (e.g. "Factorial of 5 is 120!").

FUN-FIB - The Fibonacci page (`/fib`) shall allow a user to enter a positive integer from 1 to 100, and upon pressing submit, shall show to the user the Fibonnaci of the value (e.g. "Fibonacci of 5 is 8!").  Note that the Fibonnaci series is assumed to start from index 0: f(0) = 1, f(1) = 1, f(2) = 2, f(3) = 3, f(4) = 5, f(5) = 8.

FUN-INVALID-VALUE - For both the Fibonacci and Factorial pages, if a user enters an invalid value of any kind, they shall be informed that the value is 1 (e.g., "Fibonacci of -100 is 1!")

FUN-HELLO - Accessing the hello page (`/hello`) with no trailing values in the URL shall display the message "Hello CS1632, from Prof. Laboon!".

FUN-HELLO-TRAILING - If a trailing value is provided in the URL when accessing the `/hello` page, then the message shall display hello from that trailing value.  For example, when accessing `/hello/Jazzy`, the system shall display "Hello CS1632, from Jazzy!".  This shall work for all input values.

FUN-CATHY - The Cathedral page (`/cathy`) shall display exactly three images in a numbered list.
