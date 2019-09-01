<%-- 
    Document   : constante
    Created on : 01/09/2019, 11:33:59
    Author     : Afonso
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amortização Constante</title>
    </head>
    <body>
        
        <form>
            Valor financiado(R$)
            <input type="text" size="10" name="valorFinaciado"><br>
            Perpiodo (em meses)
            <input type="text" size="10" name="periodoFinanciado"><br>
            Taxa de Juros (%)
            <input type="text" size="10" name="taxaJuros"><br>
            Calcular
            <input type="submit" value="calcular">
        </form>
            
            <table>
            <% if(request.getParameter("valorFinaciado") != null){
                try{
                   
                    double valorFinaciado = Double.parseDouble(request.getParameter("valorFinaciado"));
                    double periodoFinanciado = Double.parseDouble(request.getParameter("periodoFinanciado"));
                    double taxaJuros = Double.parseDouble(request.getParameter("taxaJuros"));
                    double valorParcela = 0;
                     //calculo de juros
                    double juros = valorFinaciado * (taxaJuros/100);
                    
                    //calculo amortização
                    double amortiz = valorFinaciado / periodoFinanciado;
                    
                    //calculo do saldo devedor
                    double saldoAnterior = valorFinaciado;
                        out.println("<h2>Tabela SAC - Sistema de Amortização Constante</h2><br>");
                        out.println("<tr>");
                        out.println("<th>Período</th>");
                        out.println("<th>Valor da Prestação</th>");
                        out.println("<th>Valor da Amortização</th>");
                        out.println("<th>Valor do Juros</th>");
                        out.println("<th>Saldo Devedor</th>");
                        out.println("</tr>");
                        out.println("<tr>");
                        out.println("<td>0</td>");
                        out.println("<td>-</td>");
                        out.println("<td>-</td>");
                        out.println("<td>-</td>");
                        out.println("<td>" + valorFinaciado + "</td>");
                        out.println("</tr>");
                    for(int i = 0; i < periodoFinanciado; i++){
                        juros = saldoAnterior * (taxaJuros/100);
                        saldoAnterior = saldoAnterior - amortiz;
                        //calculo do valor da parcela
                        valorParcela = amortiz + juros;
                       
                        out.println("<tr>");
                        out.println("<td>" +(i+1)+"</td>");
                        out.println("<td>" +valorParcela+"</td>");
                        out.println("<td>" +amortiz+"</td>");
                        out.println("<td>" +juros+"</td>");
                        out.println("<td>" +saldoAnterior+"</td>");
                        out.println("</tr>");
                    }
                }catch(Exception ex){
                    out.println("Não é valido");
                }
            }
            %>
        </table><br>
       
        
     
    </body>
</html>

