{Программа:Kursovaya
Цель: Создать функцию сортировки одномерного массива по возрастанию
и с помщью этой функции отсортировать строку матрицы А=Х^4+Y^2*X 
Переменные:A,X,Y - матрицы;tempArray - одномерный массив для сортировки;
n,i,j,k,n1,k1 - вспомогатльные переменные} 



program kursach;
type Arr = array[1..100] of real;                  //
type matrica = array[1..100,1..100] of real;       // объявление пользовательских типов данных для передачи в функции параметров массивов
                                                   
Procedure Back(A:matrica;n:integer;go:string);     //создание процедуры вывода результата сложения или умножения матриц
 begin
   writeln(go+' матриц');
   for var i:=1 to n do
     begin
    for var j:=1 to n do
       begin
          write (A[i,j]:10:2);
        end;
      writeln();
    end;
    writeln('_______________');
 end;

Procedure Back(A:matrica;n:integer;go:string;p:integer);overload;//перегрузка метода вывода результата для вывода результатов возведение матрицы в степень
var matrix:string;
 begin
   if(p=2)then
     matrix:='Y';
   if(p=4)then
     matrix:='X';
   writeln(go+' матрицы '+matrix+'^'+p);
   for var i:=1 to n do
     begin
    for var j:=1 to n do
       begin
          write (A[i,j]:10:2);
        end;
      writeln();
    end;
    writeln('_______________');
 end;

Function Sort(tempArray:Arr;n:integer):Arr;   //создание функции сортировки одномерного массива по возрастанию элементов 
var temp:real;                                //которая возвращает одномерный массив
begin
 for var i:=1 to n do
  begin
    for var j:=1 to n-1 do
    begin
       if (tempArray[j]>=tempArray[j+1]) then
      begin
        temp:=tempArray[j];
        tempArray[j]:=tempArray[j+1];
        tempArray[j+1]:=temp;
      end;
    end;
  end;
 Sort:=tempArray;
end;

Function Power(X:matrica;n:integer;p:integer):matrica;    //создание функции возведение матриц в степень, которая возвращает матрицу
var tempPower:matrica;
var tempPow:matrica;
begin
  tempPow:=X;
  for var q:=1 to p-1 do
    begin
      for var i:=1 to n do
        begin
        for var j:=1 to n do
        
          begin
             tempPower[i,j]:=0;
            for var k:=1 to n do
              begin
              tempPower[i,j]:=tempPower[i,j]+X[i,k]*tempPow[k,j];
              end;
          end;
        end;
        tempPow:=tempPower;
     end;
  Power:=tempPower;
  Back(tempPower,n,'возведение в степень',p)
end;

Function Plus(A:matrica;B:matrica;n:integer):matrica;             //создание функции сложения матриц
var C:matrica;                                                    //которая возвращает матрицу
begin
  for var i:=1 to n do
    for var j:=1 to n do
      C[i,j]:=A[i,j]+B[i,j];
      Plus:=C;
      Back(C,n,'сложение');
end;

Function Mult(A:matrica;B:matrica;n:integer):matrica;             //создание функции умножения мариц
var C:matrica;                                                    //которая возвращает матрицу
begin
  for var i:=1 to n do
    for var j:=1 to n do
      for var k:=1 to n do
      C[i,j]:= C[i,j]+A[i,k]*B[k,j];
      Back(C,n,'умножение');
      Mult:=C;
end;


var n,i,j,k:integer;
var n1,k1:string;
var A,X,Y:matrica;
var tempArray:Arr;
begin
 
    repeat                                                  //цикл с постусловием для проверки корректности вводимого значения
      writeln('введите размерность массива n');             //для задания размерности матрицы
      readln(n1);
   if(not integer.TryParse(n1,n)) then                       //TryParse - метод для определения - является ли введенное значение числом
     writeln('n должно быть числом');
      if(n<0) then
        writeln('n должно быть больше 0');
          if(n>100) then
        writeln('n должно быть меньше 100');
     until(integer.TryParse(n1,n) and (n<100) and(n>0));

 writeln('_______________');
  writeln('Матрица X');
 for i:=1 to n do
 begin
   for j:=1 to n do
    begin
      X[i,j]:=random();
      write (X[i,j]:10:2);
    end;
    writeln();
 end;
 writeln('_______________');
 writeln('Матрица Y');
 for i:=1 to n do
 begin
   for j:=1 to n do
    begin
      Y[i,j]:=random();
      write (Y[i,j]:10:2);
    end;
    writeln();
 end;
 writeln('_______________');
 A:=Plus(Power(X,n,4),Mult(Power(Y,n,2),X,n),n);            //вычисление матрицы А
   writeln('Матрица A = X^4+Y^2*X');
 for i:=1 to n do
 begin
   for j:=1 to n do
    begin
      write (A[i,j]:10:2);
    end;
    writeln();
 end;
 writeln('_______________');
 
 
 
 repeat                                                //цикл с постусловием для поверки корректности введеного значения
 writeln('введите строку массива k');                  //для выбора сортируемой строки
 readln(k1);
 if(not integer.TryParse(k1,k)) then
  writeln('k должно быть числом');
 if((k>n)) then
  writeln('k должно быть меньше или равно ',n);
 if(k<0) then
  writeln('k должно быть больше 0'); 
 until (integer.TryParse(k1,k) and (k<=n) and (k>0)); 
 
 
  for i:=1 to n do
  begin
    tempArray[i]:=A[k,i];
    write (tempArray[i]:10:2);
  end;
  writeln();
  writeln('_______________');
  tempArray:=Sort(tempArray,n);                   //сортировка строки
  writeln('Отсортированная строка');
  for i:=1 to n do
    write (tempArray[i]:10:2);
     writeln();
  writeln('_______________');
  for i:=1 to n do
   A[k,i]:=tempArray[i];                          //замена элементов k-ой строки матрицы на отсортированные
    writeln('Mассив с отсортированной строкой');
   for i:=1 to n do
 begin
   for j:=1 to n do
      write (A[i,j]:10:2);                          //вывод результата
    writeln();
 end;
 read(n);
end.