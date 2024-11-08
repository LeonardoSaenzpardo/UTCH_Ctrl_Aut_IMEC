clear import_Problema3;

function [data] = import_Problema3(filename)
    opts = detectImportOptions(filename, "Delimiter", ",", "Decimal", ".");
    data = readtable(filename, opts, "VariableNames", ["tiempo","salida","entrada"]);
endfunction

datos = import_Problema3("C:\Users\Lenovo 330\Documents\GitHub\UTCH_Ctrl_Aut_IMEC\Unidad_II\Evidencia_II_01\Problema3\Problema3.csv");

entrada = datos.vars(3).data;
salida = datos.vars(2).data;
tiempo = datos.vars(1).data;

K = 1.20;
zeta = 0.20;
wn = 0.0167;
s=%s
G = (K*(wn^2))/(s^2+(2*wn*zeta*s)+(wn^2));
G = syslin('c',G);
y = csim(entrada',tiempo',G);
plot(tiempo,salida,tiempo,entrada,tiempo,y);
