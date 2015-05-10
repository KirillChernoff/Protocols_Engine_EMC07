<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="windows-1251" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">

    <html xmlns="http://www.w3.org/1999/xhtml">

      <head>
        <meta charset="utf-8"/>
        <title>Поверка ПР с помощью ЭПР по МИ 3267-2010</title>
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
        td
        {
        font-family:Franklin Gothic Book;
        font-size: 9.5pt;
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
        <div align="center">ПРОТОКОЛ № <xsl:value-of select="EvmvmVerification/DataHeader/ProtN"/></div>
        <div align="center">поверки ПР с помощью ЭПР по МИ 3267-2010</div>
        <br/>

        <table style="table-layout:auto;" border="0" cellpadding="2" cellspacing="0" width="100%">
          <tbody>
            <tr>
              <td align="left" colspan="6" width="100%">
                Место проведения поверки: <xsl:value-of select="EvmvmVerification/DataHeader/Place"/>
              </td>
            </tr>
            <tr>
              <td align="left" width="20%">Тип ПР:</td>
              <td align="left" width="20%">
                <xsl:value-of select="EvmvmVerification/DataHeader/CurFM_NamTr"/>
              </td>
              <td align="left" width="15%">Заводской №</td>
              <td align="left" width="20%">
                <xsl:value-of select="EvmvmVerification/DataHeader/CurFM_Num"/>
              </td>
              <td align="right" width="15%">Линия №</td>
              <td align="left" width="20%">
                <xsl:value-of select="EvmvmVerification/DataHeader/Len_Num"/>
              </td>
            </tr>

            <tr>
              <td align="left" width="5%">Тип ЭПР:</td>
              <td align="left" width="20%">
                <xsl:value-of select="EvmvmVerification/DataHeader/EVMVM_NamTr"/>
              </td>
              <td align="left" width="15%">Заводской №</td>
              <td align="left" width="20%">
                <xsl:value-of select="EvmvmVerification/DataHeader/EVMVM_Num"/>
              </td>
            </tr>

            <tr>
              <td align="left" width="5%">Тип ИВК:</td>
              <td align="left" width="20%">
                <xsl:value-of select="EvmvmVerification/DataHeader/IVK_NamTr"/>
              </td>
              <td align="left" width="15%">Заводской №</td>
              <td align="left" width="20%">
                <xsl:value-of select="EvmvmVerification/DataHeader/IVK_Num"/>
              </td>
            </tr>

            <tr>
              <td align="left" >Рабочая жидкость:</td>
              <td align="left" >
                <xsl:value-of select="EvmvmVerification/DataHeader/Prod_Name"/>
              </td>
            </tr>
          </tbody>
        </table>
        <br/>

        <table style="border-collapse:collapse;"  border="1" cellpadding="5" cellspacing="0" width="55%" bordercolor="#000000">
          <caption align="left" >Таблица 1 - исходные данные</caption>
          <thead>
            <tr>
              <td align="center" width="11%">
                δ<sub>ЭПР</sub>,<br/>%
              </td>
              <td align="center" width="11%">
                Δt<sub>ЭПР</sub>,<br/>ºC
              </td>
              <td align="center" width="11%">
                Δt<sub>ПР</sub>,<br/>ºC
              </td>
              <td align="center" width="11%">
                δ<sub>ИВК</sub>,<br/>%
              </td>
              <td align="center" width="11%">
                Δν,<br/>мм<sup>2</sup>/с
              </td>
            </tr>
            <tr>
              <td align="center" width="12%">1</td>
              <td align="center" width="11%">2</td>
              <td align="center" width="11%">3</td>
              <td align="center" width="11%">4</td>
              <td align="center" width="11%">5</td>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="EvmvmVerification/DataTab1">
              <tr>
                <td align="center">
                  <xsl:value-of select="Oe"/>
                </td>
                <td align="center">
                  <xsl:value-of select="dTe"/>
                </td>
                <td align="center">
                  <xsl:value-of select="dTt"/>
                </td>
                <td align="center">
                  <xsl:value-of select="dKv"/>
                </td>
                <td align="center">
                  <xsl:value-of select="KVis"/>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
        <br/>

        <table style="border-collapse:collapse;"  border="1" cellpadding="5" cellspacing="0" width="97%" bordercolor="#000000">
          <caption align="left" >Таблица 2 - Результаты измерений и вычислений</caption>
          <thead>
            <tr>
              <td align="center" width="9%">№точ/<br/>№изм</td>
              <td align="center" width="11%">Q<sub>ji</sub>,<br/>м<sup>3</sup>/ч</td>
              <td align="center" width="11%">T<sub>ji</sub>,<br/>c</td>
              <td align="center" width="11%">t<sub>ЭПРji</sub>,<br/>ºC</td>
              <td align="center" width="11%">P<sub>ЭПРji</sub>,<br/>МПа</td>
              <td align="center" width="11%">N<sub>ЭПРji</sub>,<br/>имп</td>
              <td align="center" width="11%">K<sub>ЭПРji</sub>,<br/>имп/м<sup>3</sup></td>
              <td align="center" width="11%">ρ<sub>ППji</sub>,<br/>кг/м<sup>3</sup></td>
              <td align="center" width="11%">t<sub>ППji</sub>,<br/>ºC</td>
            
            </tr>
            <tr>
              <td align="center" width="9%">1 </td>
              <td align="center" width="11%">2 </td>
              <td align="center" width="11%">3</td>
              <td align="center" width="11%">4</td>
              <td align="center" width="11%">5</td>
              <td align="center" width="11%">6</td>
              <td align="center" width="11%">7</td>
              <td align="center" width="11%">8</td>
              <td align="center" width="11%">9</td>
            </tr>

          </thead>
          <tbody>
            <xsl:for-each select="EvmvmVerification/DataTab2">
              <tr>
                <td align="center">
                  <xsl:value-of select="ji"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Q"/>
                </td>
                <td align="center">
                  <xsl:value-of select="MTime"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Te"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Pe"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Ne"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Kec"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Db"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Tb"/>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
        <br/>

        <table style="border-collapse:collapse;"  border="1" cellpadding="5" cellspacing="0" width="97%" bordercolor="#000000">
          <caption align="left" >Окончание таблицы 2</caption>
          <thead>
            <tr>

              <td align="center" width="9%">№точ/<br/>№изм
              </td>
              <td align="center" width="11%">
                P<sub>ППji</sub>,<br/>МПа
              </td>
              <td align="center" width="11%">
                β<sub>ji</sub>,<br/>1/ºC
              </td>
              <td align="center" width="11%">
                ν<sub>ПРji</sub>,<br/>мм<sup>2</sup>/с
              </td>
              <td align="center" width="11%">
                t<sub>ПРji</sub>,<br/>ºC
              </td>
              <td align="center" width="11%">
                P<sub>ПРji</sub>,<br/>МПа
              </td>
              <td align="center" width="11%">
                f<sub>ji</sub>,<br/>Гц
              </td>
              <td align="center" width="11%">
                N<sub>ji</sub>,<br/>имп
              </td>
              <td align="center" width="11%">
                K<sub>ji</sub>,<br/>имп/м<sup>3</sup>
              </td>

            </tr>
            <tr>
              <td align="center" width="9%">1 </td>
              <td align="center" width="11%">10</td>
              <td align="center" width="11%">11</td>
              <td align="center" width="11%">12</td>
              <td align="center" width="11%">13</td>
              <td align="center" width="11%">14</td>
              <td align="center" width="11%">15</td>
              <td align="center" width="11%">16</td>
              <td align="center" width="11%">17</td>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="EvmvmVerification/DataTab22">
              <tr>
                <td align="center">
                  <xsl:value-of select="ji"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Pb"/>
                </td>
                <td align="center">
                  <xsl:value-of select="b"/>
                </td>
                <td align="center">
                  <xsl:value-of select="vt"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Tt"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Pt"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Ft"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Nt"/>
                </td>
                <td align="center">
                  <xsl:value-of select="K"/>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
        <br/>

        <table style="border-collapse:collapse;"  border="1" cellpadding="5" cellspacing="0" width="97%" bordercolor="#000000">
          <caption align="left" >Таблица 3 - Результаты поверки в точках рабочего диапазона</caption>
          <thead>
            <tr>
              <td align="center" width="9%">
                № точ.
              </td>
              <td align="center" width="11%">
                Q<sub>j</sub>,<br/>м<sup>3</sup>/ч
              </td>
              <td align="center" width="11%">
                <xsl:value-of disable-output-escaping="yes" select="EvmvmVerification/DataHeader/Tab3_Arg"/>
              </td>
              <td align="center" width="11%">
                K<sub>j</sub>,<br/>имп/м<sup>3</sup>
              </td>
              <td align="center" width="11%">
                S<sub>j</sub>,<br/>%
              </td>
              <td align="center" width="11%">
                n<sub>j</sub>
              </td>
              <td align="center" width="11%">
                S<sub>0j</sub>,<br/>%
              </td>
              <td align="center" width="11%">
                t<sub>0,95j</sub>
              </td>
              <td align="center" width="11%">
                ε<sub>j</sub>,<br/>%
              </td>

            </tr>
            <tr>
              <td align="center" width="9%">1</td>
              <td align="center" width="11%">2</td>
              <td align="center" width="11%">3</td>
              <td align="center" width="11%">4</td>
              <td align="center" width="11%">5</td>
              <td align="center" width="11%">6</td>
              <td align="center" width="11%">7</td>
              <td align="center" width="11%">8</td>
              <td align="center" width="11%">9</td>
            </tr>

          </thead>
          <tbody>
            <xsl:for-each select="EvmvmVerification/DataTab3">
              <tr>
                <td align="center">
                  <xsl:value-of select="j"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Q"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Arg"/>
                </td>
                <td align="center">
                  <xsl:value-of select="K"/>
                </td>
                <td align="center">
                  <xsl:value-of select="S"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Nm"/>
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

        <table style="border-collapse:collapse;"  border="1" cellpadding="5" cellspacing="0" width="100%" bordercolor="#000000">
          <caption align="left" >Таблица 4 - Результаты поверки в диапазоне</caption>
          <thead>
            <tr>
              <td align="center" width="10%">
                Q<sub>min</sub>,<br/>м<sup>3</sup>/ч
              </td>
              <td align="center" width="10%">
                Q<sub>max</sub>,<br/>м<sup>3</sup>/ч
              </td>
              <td align="center" width="10%">
                ν<sub>min</sub>,<br/>мм<sup>2</sup>/с
              </td>
              <td align="center" width="10%">
                ν<sub>max</sub>,<br/>мм<sup>2</sup>/с
              </td>
              <td align="center" width="10%">
                S<sub>0</sub>,<br/>%
              </td>
              <td align="center" width="10%">
                ε,<br/>%
              </td>
              <td align="center" width="10%">
                θ<sub>A</sub>,<br/>%
              </td>
              <td align="center" width="10%">
                θ<sub>t</sub>,<br/>%
              </td>
              <td align="center" width="10%">
                θ<sub>Σ</sub>,<br/>%
              </td>
              <td align="center" width="10%">
                δ,<br/>%
              </td>

            </tr>
            <tr>
              <td align="center" width="10%">1 </td>
              <td align="center" width="10%">2</td>
              <td align="center" width="10%">3</td>
              <td align="center" width="10%">4</td>
              <td align="center" width="10%">5</td>
              <td align="center" width="10%">6</td>
              <td align="center" width="10%">7</td>
              <td align="center" width="10%">8</td>
              <td align="center" width="10%">9</td>
              <td align="center" width="10%">10</td>
            </tr>

          </thead>
          <tbody>
            <xsl:for-each select="EvmvmVerification/DataTab4">
              <tr>
                <td align="center">
                  <xsl:value-of select="Qb"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Qe"/>
                </td>
                <td align="center">
                  <xsl:value-of select="vmin"/>
                </td>
                <td align="center">
                  <xsl:value-of select="vmax"/>
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
                  <xsl:value-of select="Ot"/>
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
                Заключение: ПР к дальнейшей эксплуатации
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
        <div>Дата проведения поверки:&#160;<xsl:value-of select="EvmvmVerification/DataHeader/STime"/></div>  
        
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
