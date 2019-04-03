/*
alert ("Please give your name");
var shim = prompt("What is your name?");


document.write("4 + 5 = ", 4 + 5, "<br />");
document.write("180 + 664 =", 180 + 664, "<br />");
document.write("456 + 4888 = ", 456 + 4888, "<br />");
document.write("10**10 + 2 = ", 10**10 + 2 , "<br />");
document.write("9 * 10 = ", 9 * 10, "<br />");
document.write("Max Num = ", Number.MAX_VALUE, "<br />");
document.write("Min Num = ", Number.MIN_VALUE, "<br />");

precisionTest = 0.10000000000000000002
document.write(precisionTest + 0.1000000000000000000003, "<br />");
var randNum = 5;
document.write("randNum-- = ", randNum--, "<br />");
document.write("--randNum = ", --randNum, "<br />");/* the min and max amount of num we can store in js var's in browser */

/** for strings styling
var song = "Man is not hot!"
document.write("Big : ", song.big(), "<br />");
document.write("Font color : ", song.fontcolor("pink"), "<br />");
document.write("Youtube : ", song.link("https://Youtube.com"), "<br />");
document.write("Strike: ", song.strike(), "<br />");
document.write("Sub : ", song.sub(), "<br />");
document.write("Sup : ", song.sup("MT"), "<br />");
document.write("\"5\" === 5 = ", "5" == 5, "<br/>");

/* conditionals 
var manage = 45;
if(manage >= 35){
document.write("You are too old" + "<br />");
}else if(manage <= 35){
document.write("Too young to engage!!!" + "<br />");
} else{
document.write("your age must be 35 to join" + "<br />");
}
/***** a) Conditionlas , b) eternary cond -(condtion) ? ifTrue : ifFalse
var age = 15;
switch(age) {
case 12 : 
case 14 :
document.write("above range" + " <br />");
break;
case 5 :
document.write("too young " + "<br />");
default:
document.write(" try again" + "<br />");
}
var age = 25; canIVote = (age >= 18) ? true : false;
document.write ("canIVote"+ "<br />");
var a = 0;
while(a <= 10){
document.write(a + " || ", a + "<br />")
;a++;
}
for( j = 0; j <= 20; j++){
if((j % 2) != 0){
continue;
}
if( j === 15) {
break;
}
document.write(j + "<br />");
}


/***** Enumerable */
var customer ={
  name : "shum okay",
  address : "16 brownflied way",
  Accbalance :"£" + 1000000 
  };
  for (i in customer){document.write(customer[i] + "<br />");
}

/****array*/
var bob = ["man", "DOB 1984", 5400]
document.write(bob + "<br />");

bob.splice(1, 1, "29/12/1984");
document.write(bob + "<br />");

/***** making functions for code reuse **/
function inArray(arrayToCheck, value){
  for(i = 0; i < arrayToCheck.length; i++){
    if(arrayToCheck[i] === value){
      return true;
    }
  }
  return false;
}

document.write(inArray(bob, 540));

function times2(num){
  return num*2;
}

function multi(func, num){
  return func(num);
}

var triple = function(num){
return num * 3;
}

function getSum(){
var sum = 0;
for(k = 0; k < arguments.length; k++){
sum += arguments[k];
}
return sum;
}
function times2(theArray) {
var shoping = [];
for (i = 0; i < theArray.length; i++) {
shoping.push(theArray[i] * 2);
}
return shoping;
}



/********** Recursive function that calls it self****/
function factorial(num){
  if (num <= 1){
    return 1;
  }else{
    console.log(num);
    return num * factorial(num - 1);
  }
}

function openAlert(mess){
alert(mess);
}

/************ Event handling******/
function getchar(event){
  if (event.which == null){
    return String.fromCharCode(event.keyCode);
  }else if(event.which != 0 && event.charCode != 0){
    return String.fromCharCode(event.which);
  }else{
    return null;
  }
}
/***** putting elements that we listen or pay attention*/
document.getElementById('charInput').onkeypress = function(event){
var char = getChar(event || window.event)
if (!char) return false;
document.getElementById('keyData').innerHTML =char + " was clicked";
return true;
}
document.getElementById('charInput').onfocus = function(event){
document.getElementById('keyData').innerHTML= "input Gained Focus";
}
document.getElementById('charInput').onselect = function(event){
document.getElementById('keyData').innerHTML= "text selected";
}

document.getElementById('logoButton').onmousedown= function(event){
document.getElementById('logo').className= "show";
}

document.getElementById('logoButton').onclick= function(event){
document.getElementById('logo').className= "hidden";
}

document.getElementById('logo').onmouseover= function(event){
  document.getElementById('mouseInput').value= "Mouse over image";
  document.getElementById('logo').className= "trans";
}
document.getElementById('logo').onmouseout= function(event){
  document.getElementById('logo').className= "usl";
  document.getElementById('mouseInput').value= "Mouse left image";
}

document.body.onmousemove= function(e){
  e = e || window.event;
  var pageX = e.pageX;
  var pageY = e.pageY;
  if (pageX === undefined){
    pageX = e.clientX + document.body.scrollLeft + document.documentElement.scrollLeft;
    pageY = e.clientY +document.body.scrollTop +document.documentElement.scrollTop;
  }
  document.getElementById('mouseX').value = pageX;
  document.getElementById('mouseY').value = pageY;
};

document.getElementById('clearInputs').onclick= function(event){
  var inputElements = document.getElementByTagName('input');
  for(var i = 0; i < inputElements.length; i++){
    if (inputElements[i].type == "text"){
      inputElements[i].value = "";
    }
  }
}


