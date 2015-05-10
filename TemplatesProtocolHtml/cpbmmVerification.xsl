<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="windows-1251" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">

    <html xmlns="http://www.w3.org/1999/xhtml">

      <head>
        <meta charset="utf-8"/>
        <title>Протокол поверки СРМ с помощью КП и ПП</title>
      </head>

      <style type="text/css" media="print,screen" >

        h1 {
        font-family: Franklin Gothic Book;
        font-size: 9.5pt;
        }


        div {
        font-family: Franklin Gothic Book;
        font-size: 9.5pt;
        }

        caption {
        align:left;
        font-family: Franklin Gothic Book;
        font-size: 9.5pt;
        }

        table
        th {
        font-family:Franklin Gothic Book;
        font-size: 9.5pt;
        font-style: normal;
        }
        tr
        {
        font-family:Franklin Gothic Book;
        font-size: 9.5pt;
        page-break-inside: avoid;
        }
        thead {
        display:table-header-group;
        bgcolor:white;
        }
        tbody {
        display:table-row-group;
        }
        }

        #Footer, #Header
        {
        display: none;
        }

      </style>

      <body scroll="no" >

        <div align="center">
          ПРОТОКОЛ № <xsl:value-of select="cpbmmVerification/DataHeader/ProtN"/>
        </div>
        <div align="center">поверки СРМ с помощью КП и ПП</div>
        <br/>

        <table style="table-layout:auto;" border="0" cellpadding="2" cellspacing="0" width="100%">
          <tbody>
            <tr>
              <td align="left" colspan="6" width="100%">
                Место проведения поверки: <xsl:value-of select="cpbmmVerification/DataHeader/Place"/>
              </td>
            </tr>
            <tr>
              <td align="left" width="10%">СРМ: Датчик: Тип:</td>
              <td align="left" width="20%">
                <xsl:value-of select="cpbmmVerification/DataHeader/CurFM_NamTr"/>
              </td>
              <td align="left" width="15%">Заводской №</td>
              <td align="left" width="20%">
                <xsl:value-of select="cpbmmVerification/DataHeader/CurFM_Num"/>
              </td>
              <td align="right" width="15%">Линия №</td>
              <td align="left" width="15%">
                <xsl:value-of select="cpbmmVerification/DataHeader/Len_Num"/>
              </td>
            </tr>
            <tr>
              <td align="left" width="10%">СРМ: Преоб.: Тип: </td>
              <td align="left" width="20%">
                <xsl:value-of select="cpbmmVerification/DataHeader/CurFM_NamTr1"/>
              </td>
              <td align="left" width="15%">Заводской №</td>
              <td align="left" width="20%">
                <xsl:value-of select="cpbmmVerification/DataHeader/CurFM_Num1"/>
              </td>
            </tr>
            <tr>
              <td align="left" width="10%">ТПУ: Тип: </td>
              <td align="left" width="20%">
                <xsl:value-of select="cpbmmVerification/DataHeader/TPU_NamTr"/>
              </td>
              <td align="left" width="15%">Заводской №</td>
              <td align="left" width="20%">
                <xsl:value-of select="cpbmmVerification/DataHeader/TPU_Num"/>
              </td>
            </tr>
            <tr>
              <td align="left" width="10%">ПП: Тип: </td>
              <td align="left" width="20%">
                <xsl:value-of select="cpbmmVerification/DataHeader/PP_NamTr"/>
              </td>
              <td align="left" width="15%">Заводской №</td>
              <td align="left" width="20%">
                <xsl:value-of select="cpbmmVerification/DataHeader/PP_Num"/>
              </td>
            </tr>
            <tr>
              <td align="left" width="10%">ИВК: Тип: </td>
              <td align="left" width="20%">
                <xsl:value-of select="cpbmmVerification/DataHeader/IVK_NamTr"/>
              </td>
              <td align="left" width="15%">Заводской №</td>
              <td align="left" width="20%">
                <xsl:value-of select="cpbmmVerification/DataHeader/IVK_Num"/>
              </td>
            </tr>
            <tr>
              <td align="left" width="25%" >
                Рабочая жидкость: <xsl:value-of select="cpbmmVerification/DataHeader/Prod_Name"/>
              </td>
            </tr>
          </tbody>
        </table>
        <br/>

        <table style="border-collapse:collapse;"  border="1" cellpadding="5" cellspacing="0" width="88%" bordercolor="#000000">
          <caption align="left" >Таблица 1 - исходные данные</caption>
          <thead>
            <tr>
              <td align="center" width="11%">Детекторы</td>
              <td align="center" width="11%">
                V<sub>0</sub>,м<sup>3</sup>
              </td>
              <td align="center" width="11%">D, мм</td>
              <td align="center" width="11%">S, мм</td>
              <td align="center" width="11%">E, МПа</td>
              <td align="center" width="11%">
                α<sub>k1</sub>,<br/>1/ºC
              </td>
              <td align="center" width="11%">
                α<sub>д</sub>,<br/>1/ºC
              </td>              
              <td align="center" width="11%">
                θ<sub>ΣO</sub>,<br/>%
              </td>
            </tr>
            <tr>
              <td align="center" width="11%">1</td>
              <td align="center" width="11%">2</td>
              <td align="center" width="11%">3</td>
              <td align="center" width="11%">4</td>
              <td align="center" width="11%">5</td>
              <td align="center" width="11%">6</td>
              <td align="center" width="11%">7</td>
              <td align="center" width="11%">8</td>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="cpbmmVerification/DataTab1">
              <tr>
                <td align="center">
                  <xsl:value-of select="DtNam"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Vo"/>
                </td>
                <td align="center">
                  <xsl:value-of select="D"/>
                </td>
                <td align="center">
                  <xsl:value-of select="S"/>
                </td>
                <td align="center">
                  <xsl:value-of select="E"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Ak"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Ad"/>
                </td>
                <td align="center">
                  <xsl:value-of select="SOo"/>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
        <br/>               

        <table style="border-collapse:collapse;"  border="1" cellpadding="5" cellspacing="0" width="88%" bordercolor="#000000">
          <caption align="left" >Продолжение таблицы 1</caption>
          <thead>
            <tr>
              <td align="center" width="11%">
                θ<sub>VO</sub>,<br/>%
              </td>             
              <td align="center" width="11%">
                Δt<sub>ПУ</sub>,<br/>ºC
              </td>
              <td align="center" width="11%">
                Δt<sub>ПП</sub>,<br/> ºC
              </td>
              <td align="center" width="11%">
                Δρ<sub>ПП</sub>,<br/>
                кг/м<sup>3</sup>
              </td>
              <td align="center" width="11%">
                δ<sub>ИВК</sub>, <br/>
                %
              </td>
              <td align="center" width="11%">
                K<sub>ПМ</sub>, <br/>
                имп/т
              </td>
              <td align="center" width="11%">
                K<sub>МУСТ</sub>,<br/>
                г/с/мкс
              </td>
              <td align="center" width="11%">
                MF<sub>УСТ</sub>
              </td>
            </tr>
            <tr>
              <td align="center" width="11%">9</td>
              <td align="center" width="11%">10</td>
              <td align="center" width="11%">11</td>
              <td align="center" width="11%">12</td>
              <td align="center" width="11%">13</td>
              <td align="center" width="11%">14</td>
              <td align="center" width="11%">15</td>
              <td align="center" width="11%">16</td>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="cpbmmVerification/DataTab12">
              <tr>
                <td align="center">
                  <xsl:value-of select="OVo"/>
                </td>                
                <td align="center">
                  <xsl:value-of select="dTp"/>
                </td>
                <td align="center">
                  <xsl:value-of select="dTb"/>
                </td>
                <td align="center">
                  <xsl:value-of select="dDb"/>
                </td>
                <td align="center">
                  <xsl:value-of select="dKm"/>
                </td>
                <td align="center">
                  <xsl:value-of select="MCf"/>
                </td>
                <td align="center">
                  <xsl:value-of select="MCfM"/>
                </td>
                <td align="center">
                  <xsl:value-of select="MF"/>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
        <br/>

        <table style="border-collapse:collapse;"  border="1" cellpadding="5" cellspacing="0" width="88%" bordercolor="#000000">
          <caption align="left" >Окончание таблицы 1</caption>
          <thead>
            <tr>
              <td align="center" width="11%">
                Q<sub>НОМ</sub>,<br/>
                т/ч
              </td>
              <td align="center" width="11%">
                ZS, <br/>
                т/ч
              </td>
              <td align="center" width="11%">
                δ<sub>tдоп</sub>, <br/>
                %/ºC
              </td>
              <td align="center" width="11%">
                δ<sub>Pдоп</sub>, <br/>
                %/0.1МПа
              </td>
              <td align="center" width="11%">
                t<sub>MIN</sub>, <br/>
                ºC
              </td>
              <td align="center" width="11%">
                t<sub>MAX</sub>, <br/>
                ºC
              </td>
              <td align="center" width="11%">
                P<sub>MIN</sub>, <br/>
                МПа
              </td>
              <td align="center" width="11%">
                P<sub>MAX</sub>, <br/>
                МПа
              </td>
            </tr>
            <tr>
              <td align="center" width="11%">17</td>
              <td align="center" width="11%">18</td>
              <td align="center" width="11%">19</td>
              <td align="center" width="11%">20</td>
              <td align="center" width="11%">21</td>
              <td align="center" width="11%">22</td>
              <td align="center" width="11%">23</td>
              <td align="center" width="11%">24</td>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="cpbmmVerification/DataTab13">
              <tr>
                <td align="center">
                  <xsl:value-of select="Qnom"/>
                </td>                
                <td align="center">
                  <xsl:value-of select="Zs"/>
                </td>
                <td align="center">
                  <xsl:value-of select="dTdop"/>
                </td>
                <td align="center">
                  <xsl:value-of select="dPdop"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Tmin"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Tmax"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Pmin"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Pmax"/>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
        <br/>

        <table style="border-collapse:collapse;"  border="1" cellpadding="5" cellspacing="0" width="88%" bordercolor="#000000">
          <caption align="left" >Таблица 2 - Результаты измерений и вычислений</caption>
          <thead>
            <tr>
              <td align="center">
                №точ/<br/>№изм
              </td>
              <td align="center">
                Q<sub>ji</sub>,<br/>т/ч
              </td>
              <td align="center">
                Детекторы
              </td>
              <td align="center">
                T<sub>ji</sub>,<br/>c
              </td>
              <td align="center">
                t<sub>ПУji</sub>,<br/>ºC
              </td>
              <td align="center">
                t<sub>Дji</sub>,<br/>ºC
              </td>
              <td align="center">
                P<sub>ПУji</sub>,<br/>МПа
              </td>
              <td align="center">
                ρ<sub>ППji</sub>,<br/>кг/м<sup>3</sup>
              </td>
            </tr>
            <tr>
              <td align="center" width="11%">1 </td>
              <td align="center" width="11%">2 </td>
              <td align="center" width="11%">3</td>
              <td align="center" width="11%">4</td>
              <td align="center" width="11%">5</td>
              <td align="center" width="11%">6</td>
              <td align="center" width="11%">7</td>
              <td align="center" width="11%">8</td>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="cpbmmVerification/DataTab2">
              <tr>
                <td align="center">
                  <xsl:value-of select="ji"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Q"/>
                </td>
                <td align="center">
                  <xsl:value-of select="DtNam"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Tdd"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Tp"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Td"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Pp"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Db"/>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
        <br/>

        <table style="border-collapse:collapse;"  border="1" cellpadding="5" cellspacing="0" width="88%" bordercolor="#000000">
          <caption align="left" >Окончание таблицы 2</caption>
          <thead>
            <tr>
              <td align="center">
                №точ/<br/>№изм
              </td>
              <td align="center">
                t<sub>ППji</sub>,<br/>ºC
              </td>
              <td align="center">
                P<sub>ППji</sub>,<br/>МПа
              </td>
              <td align="center">
                β<sub>ji</sub>,<br/>
                1/ºC
              </td>
              <td align="center">
                N<sub>ji</sub>,<br/>
                имп
              </td>
              <td align="center">
                M<sub>ПУji</sub>,<br/>
                т
              </td>
              <td align="center">
                M<sub>ji</sub>, <br/>
                имп/т
              </td>
              <td align="center">
                <xsl:value-of disable-output-escaping="yes" select="cpbmmVerification/DataHeader/Tab2End_KMod"/>
              </td>
            </tr>
            <tr>
              <td align="center" width="11%">1 </td>
              <td align="center" width="11%">9 </td>
              <td align="center" width="11%">10</td>
              <td align="center" width="11%">11</td>
              <td align="center" width="11%">12</td>
              <td align="center" width="11%">13</td>
              <td align="center" width="11%">14</td>
              <td align="center" width="11%">15</td>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="cpbmmVerification/DataTab22">
              <tr>
                <td align="center">
                  <xsl:value-of select="ji"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Tb"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Pb"/>
                </td>
                <td align="center">
                  <xsl:value-of select="b"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Ndd"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Mp"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Mt"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Kmod"/>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
        <br/>

        <table style="border-collapse:collapse;"  border="1" cellpadding="5" cellspacing="0" width="88%" bordercolor="#000000">
          <caption align="left" >Таблица 3 - Результаты поверки в точках рабочего диапазона</caption>
          <thead>
            <tr>
              <td align="center">
                № точ.
              </td>
              <td align="center">
                Q<sub>j</sub>,<br/>
                т/ч
              </td>
              <td align="center">
                <xsl:value-of disable-output-escaping="yes" select="cpbmmVerification/DataHeader/Tab3_KMod"/>
              </td>
              <td align="center">
                n<sub>j</sub>
              </td>
              <td align="center">
                S<sub>j</sub>,<br/>
                %
              </td>
              <td align="center">
                S<sub>0j</sub>,<br/>
                %
              </td>
              <td align="center">
                t<sub>0,95j</sub>
              </td>
              <td align="center">
                ε<sub>j</sub>,<br/>
                %
              </td>
            </tr>
            <tr>
              <td align="center" width="11%">1 </td>
              <td align="center" width="11%">2 </td>
              <td align="center" width="11%">3</td>
              <td align="center" width="11%">4</td>
              <td align="center" width="11%">5</td>
              <td align="center" width="11%">6</td>
              <td align="center" width="11%">7</td>
              <td align="center" width="11%">8</td>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="cpbmmVerification/DataTab3">
              <tr>
                <td align="center">
                  <xsl:value-of select="j"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Q"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Kmod"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Nm"/>
                </td>
                <td align="center">
                  <xsl:value-of select="S"/>
                </td>
                <td align="center">
                  <xsl:value-of select="So"/>
                </td>
                <td align="center">
                  <xsl:value-of select="t095"/>
                </td>
                <td align="center">
                  <xsl:value-of select="e"/>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
        <br/>

        <table style="border-collapse:collapse;"  border="1" cellpadding="5" cellspacing="0" width="88%" bordercolor="#000000">
          <caption align="left" >Таблица 4 - Результаты поверки в рабочем диапазоне</caption>
          <thead>
            <tr>
              <td align="center">
                Q<sub>min</sub>,<br/>т/ч
              </td>
              <td align="center">
                Q<sub>max</sub>,<br/>т/ч
              </td>
              <td align="center">
                <xsl:value-of disable-output-escaping="yes" select="cpbmmVerification/DataHeader/Tab4_KMod"/>
              </td>
              <td align="center">
                S<sub>0</sub>,<br/>%
              </td>
              <td align="center">
                ε,<br/>%
              </td>
              <td align="center">
                θ<sub>A</sub>,<br/>%
              </td>
              <td align="center">
                θ<sub>Z</sub>,<br/>%
              </td>
              <td align="center">
                θ<sub>ρ</sub>,<br/>%
              </td>
            </tr>
            <tr>
              <td align="center" width="11%">1 </td>
              <td align="center" width="11%">2 </td>
              <td align="center" width="11%">3</td>
              <td align="center" width="11%">4</td>
              <td align="center" width="11%">5</td>
              <td align="center" width="11%">6</td>
              <td align="center" width="11%">7</td>
              <td align="center" width="11%">8</td>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="cpbmmVerification/DataTab4">
              <tr>
                <td align="center">
                  <xsl:value-of select="Qmin"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Qmax"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Kmod"/>
                </td>
                <td align="center">
                  <xsl:value-of select="So"/>
                </td>
                <td align="center">
                  <xsl:value-of select="e"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Oa"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Oz"/>
                </td>
                <td align="center">
                  <xsl:value-of select="OD"/>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
        <br/>

        <table style="border-collapse:collapse;"  border="1" cellpadding="5" cellspacing="0" width="77%" bordercolor="#000000">
          <caption align="left" >Окончание таблицы 4 </caption>
          <thead>
            <tr>
              <td align="center">
                θ<sub>t</sub>,<br/>
                %
              </td>
              <td align="center">
                t<sub>П</sub>, <br/>
                ºC
              </td>
              <td align="center">
                θ<sub>Mt</sub>,<br/>
                %
              </td>
              <td align="center">
                P<sub>П</sub>,<br/>
                МПа
              </td>
              <td align="center">
                θ<sub>MP</sub>,<br/>
                %
              </td>
              <td align="center">
                θ,<br/>
                %
              </td>
              <td align="center">
                δ,<br/>
                %
              </td>
            </tr>
            <tr>
              <td align="center" width="11%">9 </td>
              <td align="center" width="11%">10 </td>
              <td align="center" width="11%">11</td>
              <td align="center" width="11%">12</td>
              <td align="center" width="11%">13</td>
              <td align="center" width="11%">14</td>
              <td align="center" width="11%">15</td>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="cpbmmVerification/DataTab41">
              <tr>
                <td align="center">
                  <xsl:value-of select="Ot"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Tt"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Omt"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Pt"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Omp"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Os"/>
                </td>
                <td align="center">
                  <xsl:value-of select="d"/>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
        <br/>

        <table>
          <tbody>
            <tr>
              <td align="left" width="70%">
                Заключение: СРМ к дальнейшей эксплуатации
              </td>
              <td align="center" width="30%">
                ____________________________
              </td>
            </tr>
            <tr>
              <td>

              </td>
              <td align="center">
                (годен, не годен)
              </td>
            </tr>
          </tbody>
        </table>

        <br/>
        <br/>

        <table>
          <tbody>
            <tr>
              <td align="left" width="60%">
                Подпись лица, проводившего поверку
              </td>
              <td width="19%">
                ____________________________
              </td>
              <td align="center" width="2%">
                /
              </td>
              <td width="19%">
                ____________________________
              </td>
            </tr>
            <tr>
              <td>

              </td>
              <td align="center" valign="top">
                (подпись)
              </td>
              <td>

              </td>
              <td align="center" valign="top">
                И.О. Фамилия
              </td>
            </tr>
          </tbody>
        </table>

        <br/>
        <div>
          Дата проведения поверки:&#160;<xsl:value-of select="cpbmmVerification/DataHeader/STime"/>
        </div>

      </body>
    </html>

  </xsl:template>
</xsl:stylesheet>
