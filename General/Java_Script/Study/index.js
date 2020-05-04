let a = 10;
const b = "10";
//==compara o valor de duas expressoes
//"" quer dizer texto, string
//!== compara se valor e tipos sao diferentes
//!= compara se os valores sao diferentes
//&& para poder comparar duas condiçoes, tem que ser verdadeiras, caso uma seja e aoutra nao, toda sentença é ignorada
//|| "or" compara se uma é verdade ou as aduas
console.log(a == b || typeof a == 'string');





//if(condiçao){}


let cor = "amarelo"


if (cor === "verde") {


    console.log ('siga');

} else  if (cor === "amarelo") {
    console.log("atençao"); 
 } else{

    console.log('pare');
}