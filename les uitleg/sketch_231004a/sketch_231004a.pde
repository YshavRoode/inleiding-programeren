String zin = "dit is een zin met meerdere woorden";
String[] woorden = zin.split(" ");

//opdract= tel het aantal woorden in de zin

int aantal = 0;

for(String woord : woorden) {
aantal++;
}
println("aantal woord:" + aantal);

int aantalkorter = woorden.length;
println("aantalwoorden: " + aantalkorter);
