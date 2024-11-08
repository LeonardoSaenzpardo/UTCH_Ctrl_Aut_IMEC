clear import_Problema1;

function [data] = import_Problema1(filename)
    opts = detectImportOptions(filename, "Delimiter", ",", "Decimal", ".");
    data = readtable(filename, opts, "VariableNames", ["tiempo","salida","entrada"]);
endfunction

datos = import_Problema1("C:\Users\Lenovo 330\Documents\GitHub\UTCH_Ctrl_Aut_IMEC\Unidad_II\Evidencia_II_01\Problema1\Problema1.csv");

entrada = datos.vars(3).data;
salida = datos.vars(2).data;
tiempo = datos.vars(1).data;

K = 2.04; 
tau = 500;
s = %s;
G = K / (tau * s + 1);
G = syslin('c', G);
y = csim(entrada', tiempo', G);
plot(tiempo, salida, tiempo, entrada, tiempo, y);
