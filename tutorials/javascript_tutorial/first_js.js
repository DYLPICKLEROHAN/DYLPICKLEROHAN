//Pop up alert
alert('Hello');

//Simple Math
2+2

//Clears the webpage content and just writes the text
document.body.innerHTML = 'hello';

//Floating point number issues
0.1+0.2 //=0.30000000000000004
//convert dollars to cents to store as integers

//rounding numbers
Math.round(1.111, 1)

//data type
typeof('text') //string

//Type coersion
3 + hello //'3hello'
'$'+20+7.99 //'$207.99'
'$' + (20+7.99) //'$27.990000000000002'
'$' +(2000+799)/100 //'$27.99'
'Items ('+(1+1)+'):     $'+ (2800+94)/100 //='Items (2):     $28.94'
 
//String creation
'singel quotes' // Use this as default
"double quotes" // use if single quote in string
`back ticks` //template strings, allows interpolation with ${} like f'{}' in [ython (see below)]

//'i'm hungi
'i\'m hungi'

//interpolation
`Items (${1+1}):   $${(2000+99)/100}` //'Items (2):   $20.99'

//Multiline strings oonly with back ticks
`some
        text`

