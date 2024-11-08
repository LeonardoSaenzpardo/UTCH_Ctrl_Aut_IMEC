clear import_Problema2;

function [data] = import_Problema2(filename)
    opts = detectImportOptions(filename, "Delimiter", ",", "Decimal", ".");
    data = readtable(filename, opts, "VariableNames", ["tiempo","salida","entrada"]);
endfunction

datos = import_Problema1("C:\Users\Lenovo 330\Documents\GitHub\UTCH_Ctrl_Aut_IMEC\Unidad_II\Evidencia_II_01\Problema2\Problema2.csv");

entrada = datos.vars(3).data;
salida = datos.vars(2).data;
tiempo = datos.vars(1).data;

K = .48; 
tau = 300;
s = %s;
G = K / (tau * s + 1);
G = syslin('c', G);
y = csim(entrada', tiempo', G);
plot(tiempo, salida, tiempo, entrada, tiempo, y);
