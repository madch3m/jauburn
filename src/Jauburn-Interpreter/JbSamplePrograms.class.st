"
Just a place to house a few sample programs
"
Class {
	#name : #JbSamplePrograms,
	#superclass : #Object,
	#category : #'Jauburn-Interpreter-SamplePrograms'
}

{ #category : #'as yet unclassified' }
JbSamplePrograms class >> findGCD [ 



^ ' var gcd = function(a, b)
   var val1 = mod(a,b);
    if (val1 == 0)
  { 
     return b

 }
  else 
{ 
   return gcd(b, temp1);

 }
};
var input1 = input("Please enter first number");
var input2 = input("Please enter second number");
var answer = gcd(input1, input2);

  print("Using the Euclidean formula, GCD is: ", result);

'
]

{ #category : #'as yet unclassified' }
JbSamplePrograms class >> findSqrt [

Transcript clear.

^'
var Input = input("Please enter a number");
var attempts = input("Enter the approximation number");
var val = Input;
var capturedVal = 0;
var divisor = 0;
while (attempts > 0){
   divisor = Input / val;
   capturedVal = val + divisor;
   val = capturedVal / 2;
    println("Approximation step: ", val);
    attempts = attempts - 1;


}

 println("cr");
 println("The result is: ", val);


'
]

{ #category : #'sample programs' }
JbSamplePrograms class >> noFunctions [
	"self run: #noFunctions"

	^'var x = 1;
var y = 10 * x - 1;
if (y == 9) { 
   x = 16;
}
'
]

{ #category : #utilities }
JbSamplePrograms class >> run: method [
	"Look at sample programs for examples of using this method."

	^JbInterpreter new run: (self perform: method)
]
