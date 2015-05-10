<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="windows-1251" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">

    <html xmlns="http://www.w3.org/1999/xhtml">

      <head>
        <meta charset="utf-8"/>
        <title>Протокол контроля МХ ПР c помощью ЭПР</title>
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

        <div align="center">Протокол контроля МХ ПР c помощью ЭПР</div>
        <br/>
        <table style="table-layout:auto;" border="0" cellpadding="2" cellspacing="0" width="100%">
          <tbody>
            <tr>
              <td align="left" colspan="6" width="100%">
                Место проведения КМХ:&#160;<xsl:value-of select="EvmvmEmsg/DataHeader/Place"/>
              </td>
            </tr>
            <tr>
              <td align="left" width="10%">Тип ПР:</td>
              <td align="left" width="15%">
                <xsl:value-of select="EvmvmEmsg/DataHeader/CurFM_NamTr"/>
              </td>
              <td align="left" width="15%">Заводской №</td>
              <td align="left" width="15%">
                <xsl:value-of select="EvmvmEmsg/DataHeader/CurFM_Num"/>
              </td>
              <td align="right" width="15%">Линия №</td>
              <td align="left" width="15%">
                <xsl:value-of select="EvmvmEmsg/DataHeader/Len_Num"/>
              </td>
            </tr>

            <tr>
              <td align="left" width="10%">Тип ЭПР: </td>
              <td align="left" width="15%">
                <xsl:value-of select="EvmvmEmsg/DataHeader/EVMVM_NamTr"/>
              </td>
              <td align="left" width="15%">Заводской №</td>
              <td align="left" width="15%">
                <xsl:value-of select="EvmvmEmsg/DataHeader/EVMVM_Num"/>
              </td>
              <td align="right" width="15%">Дата поверки</td>
              <td align="left" width="15%">
                <xsl:value-of select="EvmvmEmsg/DataHeader/EVMVM_PrDate"/>
              </td>
            </tr>

            <tr>
              <td align="left" width="10%">Тип ИВК:</td>
              <td align="left" width="15%">
                <xsl:value-of select="EvmvmEmsg/DataHeader/IVK_NamTr"/>
              </td>
              <td align="left" width="15%">Заводской №</td>
              <td align="left" width="15%">
                <xsl:value-of select="EvmvmEmsg/DataHeader/IVK_Num"/>
              </td>
            </tr>

            <tr>
              <td align="left" colspan="4">
                Рабочая жидкость:&#160;<xsl:value-of select="EvmvmEmsg/DataHeader/Prod_Name"/>
              </td>
            </tr>

            <tr>
              <td align="left" colspan="4">
                Вязкость нефти при КМХ, мм<sup>2</sup>/с (сСт):&#160;<xsl:value-of select="EvmvmEmsg/DataHeader/Prod_KVis"/>
              </td>
            </tr>
          </tbody>
        </table>
        <br/>

        <table style="border-collapse:collapse;"  border="1" cellpadding="5" cellspacing="0" width="66%" bordercolor="#000000">
          <caption align="left" >Таблица 1 - Точки расходов при поверки ПР</caption>
          <thead>
            <tr>
              <td align="center" colspan="6" >
                Точки расходов (м<sup>3</sup>/ч) или f/ν (Гц/сСт) для ПР
              </td>
            </tr>
            <tr>
              <td align="center" width="11%">
                <xsl:value-of disable-output-escaping="yes" select="EvmvmEmsg/DataHeader/Tab1_Q1"/>
              </td>
              <td align="center" width="11%">
                <xsl:value-of disable-output-escaping="yes" select="EvmvmEmsg/DataHeader/Tab1_Q2"/>
              </td>
              <td align="center" width="11%">
                <xsl:value-of disable-output-escaping="yes" select="EvmvmEmsg/DataHeader/Tab1_Q3"/>
              </td>
              <td align="center" width="11%">
                <xsl:value-of disable-output-escaping="yes" select="EvmvmEmsg/DataHeader/Tab1_Q4"/>
              </td>
              <td align="center" width="11%">
                <xsl:value-of disable-output-escaping="yes" select="EvmvmEmsg/DataHeader/Tab1_Q5"/>
              </td>
              <td align="center" width="11%">
                <xsl:value-of disable-output-escaping="yes" select="EvmvmEmsg/DataHeader/Tab1_Q6"/>
              </td>
            </tr>
            <tr>
              <td align="center" width="11%">1</td>
              <td align="center" width="11%">2</td>
              <td align="center" width="11%">3</td>
              <td align="center" width="11%">4</td>
              <td align="center" width="11%">5</td>
              <td align="center" width="11%">6</td>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="EvmvmEmsg/DataTab1">
              <tr>
                <td align="center">
                  <xsl:value-of select="QA1"/>
                </td>
                <td align="center">
                  <xsl:value-of select="QA2"/>
                </td>
                <td align="center">
                  <xsl:value-of select="QA3"/>
                </td>
                <td align="center">
                  <xsl:value-of select="QA4"/>
                </td>
                <td align="center">
                  <xsl:value-of select="QA5"/>
                </td>
                <td align="center">
                  <xsl:value-of select="QA6"/>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
        <br/>

        <table style="border-collapse:collapse;"  border="1" cellpadding="5" cellspacing="0" width="89%" bordercolor="#000000">
          <caption align="left" >Таблица 2 - Результаты измерений и вычислений</caption>
          <thead>
            <tr>
              <td align="center" width="9%">
                №точ/<br/>№изм
              </td>
              <td align="center" width="10%">
                Q<sub>ji</sub>,<br/>м<sup>3</sup>/ч
              </td>
              <td align="center" width="10%">
                T<sub>ji</sub>,<br/>c
              </td>
              <td align="center" width="10%">
                t<sub>Эпрji</sub>,<br/>ºC
              </td>
              <td align="center" width="10%">
                P<sub>Эпрji</sub>,<br/>МПа
              </td>
              <td align="center" width="10%">
                N<sub>Эпрji</sub>,<br/>имп
              </td>
              <td align="center" width="10%">
                K<sub>Эпрji</sub>,<br/>имп/м<sup>3</sup>
              </td>
              <td align="center" width="10%">
                ρ<sub>ППji</sub>,<br/>кг/м<sup>3</sup>
              </td>
              <td align="center" width="11%">
                t<sub>ППji</sub>,<br/>ºC
              </td>
            </tr>
            <tr>
              <td align="center" width="9%">1 </td>
              <td align="center" width="10%">2 </td>
              <td align="center" width="10%">3 </td>
              <td align="center" width="10%">4 </td>
              <td align="center" width="10%">5 </td>
              <td align="center" width="10%">6 </td>
              <td align="center" width="10%">7 </td>
              <td align="center" width="10%">8 </td>
              <td align="center" width="10%">9 </td>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="EvmvmEmsg/DataTab2">
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

        <table style="border-collapse:collapse;"  border="1" cellpadding="5" cellspacing="0" width="99%" bordercolor="#000000">
          <caption align="left" >Окончание таблицы 2</caption>
          <thead>
            <tr>
              <td align="center" width="9%">
                №точ/<br/>№изм
              </td>
              <td align="center" width="10%">
                P<sub>ППji</sub>,<br/>МПа
              </td>
              <td align="center" width="10%">
                ν<sub>ПРji</sub>,<br/>мм<sup>2</sup>/c
              </td>
              <td align="center" width="10%">
                t<sub>ПРji</sub>,<br/>ºC
              </td>
              <td align="center" width="10%">
                P<sub>ПРji</sub>,<br/>МПа
              </td>
              <td align="center" width="10%">
                N<sub>ji</sub>,<br/>имп
              </td>
              <td align="center" width="10%">
                K<sub>ji</sub>,<br/>имп/м<sup>3</sup>
              </td>
              <td align="center" width="10%">
                K<sub>j</sub>,<br/>имп/м<sup>3</sup>
              </td>
              <td align="center" width="10%">
                K<sub>расчj</sub>,<br/>имп/м<sup>3</sup>
              </td>
              <td align="center" width="10%">
                δ<sub>j</sub>,<br/>%
              </td>
            </tr>
            <tr>
              <td align="center" width="9%">1 </td>
              <td align="center" width="10%">10</td>
              <td align="center" width="10%">11</td>
              <td align="center" width="10%">12</td>
              <td align="center" width="10%">13</td>
              <td align="center" width="10%">14</td>
              <td align="center" width="10%">15</td>
              <td align="center" width="10%">16</td>
              <td align="center" width="10%">17</td>
              <td align="center" width="10%">18</td>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="EvmvmEmsg/DataTab3">
              <tr>
                <td align="center">
                  <xsl:value-of select="ji"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Pb"/>
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
                  <xsl:value-of select="Nt"/>
                </td>
                <td align="center">
                  <xsl:value-of select="K"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Kj"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Kc"/>
                </td>
                <td align="center">
                  <xsl:value-of select="dK"/>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
        <br/>

        <div>
          Заключение: δmax =&#160;<xsl:value-of select="EvmvmEmsg/DataHeader/EVMVM_dKmax"/>%. ПР к дальнейшей эксплуатации (годен, не годен и подлежит внеочередной поверке)
        </div>
        <br/>
        <div>
          Подпись лиц, проводивших КМХ:
        </div>

        <table>
          <tbody>
            <tr>
              <td align="left" width="60%">
                От сервисной организации
              </td>
              <td width="40%">
                ____________________________________________________
              </td>
            </tr>
            <tr>
              <td>

              </td>
              <td align="center" valign="top">
                (должность, фамилия, инициалы, подпись)
              </td>
            </tr>
          </tbody>
        </table>
        <br/>
        <table>
          <tbody>
            <tr>
              <td align="left" width="60%">
                От сдающей стороны
              </td>
              <td width="40%">
                ____________________________________________________
              </td>
            </tr>
            <tr>
              <td>

              </td>
              <td align="center" valign="top">
                (должность, фамилия, инициалы, подпись)
              </td>
            </tr>
          </tbody>
        </table>
        <br/>
        <table>
          <tbody>
            <tr>
              <td align="left" width="60%">
                От принимающей стороны
              </td>
              <td width="40%">
                ____________________________________________________
              </td>
            </tr>
            <tr>
              <td>

              </td>
              <td align="center" valign="top">
                (должность, фамилия, инициалы, подпись)
              </td>
            </tr>
          </tbody>
        </table>
        <br/>
        <div>
          Дата проведения поверки:&#160;<xsl:value-of select="EvmvmEmsg/DataHeader/STime"/>
        </div>

      </body>
    </html>

  </xsl:template>
</xsl:stylesheet>
