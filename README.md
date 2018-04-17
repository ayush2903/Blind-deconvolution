"# Blind-deconvolution" 

SURA_Code contains the main file. Running this code will fetch a blurred image from the system and display the predicted deblurred (sharp) image.

Implemetation of an efficient numerical algorithm that is guaranteed to recover the exact solution, when the number of measurements
is (up to log-factors) slightly larger than the information-theoretical minimum, and under reasonable conditions.

A variation of gradient descent, starting at a carefully chosen initial guess to converge to the true solution is applied. It ensures that the iterates are inside some properly chosen basin of attraction of the true solution.
