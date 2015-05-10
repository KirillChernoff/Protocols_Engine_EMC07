<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="windows-1251" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">

    <html xmlns="http://www.w3.org/1999/xhtml">

      <head>
        <meta charset="utf-8"/>
        <title>Протокол контроля МХ рабочего ПР по контрольному ПР</title>
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

        <div align="center">Протокол контроля МХ рабочего ПР по контрольному ПР</div>
        <br/>
        <table style="table-layout:auto;" border="0" cellpadding="2" cellspacing="0" width="100%">
          <tbody>
		  
            <tr>
              <td align="left" colspan="6" width="100%">
                Место проведения КМХ: <xsl:value-of select="EvmvmCheck/DataHeader/Place"/>
              </td>
            </tr>
			
            <tr>
              <td align="left" width="15%">Тип ПР:</td>
              <td align="left" width="10%">
                <xsl:value-of select="EvmvmCheck/DataHeader/CurFM_NamTr"/>
              </td>
              <td align="left" width="15%">Заводской №</td>
              <td align="left" width="15%">
                <xsl:value-of select="EvmvmCheck/DataHeader/CurFM_Num"/>
              </td>
              <td align="right" width="15%">Линия №</td>
              <td align="left" width="15%">
                <xsl:value-of select="EvmvmCheck/DataHeader/Len_Num"/>
              </td>
            </tr>

            <tr>
              <td align="left" width="15%"> Тип контрольного ПР: </td>
              <td align="left" width="10%">
                <xsl:value-of select="EvmvmCheck/DataHeader/EVMVM_NamTr"/>
              </td>
              <td align="left" width="15%">Заводской №</td>
              <td align="left" width="15%">
                <xsl:value-of select="EvmvmCheck/DataHeader/EVMVM_Num"/>
              </td>
              <td align="right" width="15%">Дата поверки:</td>
              <td align="left" width="15%">
                <xsl:value-of select="EvmvmCheck/DataHeader/EVMVM_PrDate"/>
              </td>
            </tr>
            
			<tr>
              <td align="left" colspan="6"  width="100%">
                Вязкость нефти при КМХ, мм<sup>2</sup>/с (сСт):&#160;<xsl:value-of select="EvmvmCheck/DataHeader/Prod_KVis"/>
              </td>
            </tr>
          </tbody>
        </table>
        <br/>

        <table style="border-collapse:collapse;"  border="1" cellpadding="5" cellspacing="0" width="66%" bordercolor="#000000">
          <caption align="left" >Таблица 1 - исходные данные</caption>
          <thead>
            <tr>
              <td align="center" colspan="9" >
                Точки расходов (м<sup>3</sup>/ч) или f/ν (Гц/сСт) для ПР
              </td>
            </tr>
            <tr>
              <td align="center" width="11%">
                <xsl:value-of disable-output-escaping="yes" select="EvmvmCheck/DataHeader/Tab1_Q1"/>
              </td>
              <td align="center" width="11%">
                <xsl:value-of disable-output-escaping="yes" select="EvmvmCheck/DataHeader/Tab1_Q2"/>
              </td>
              <td align="center" width="11%">
                <xsl:value-of disable-output-escaping="yes" select="EvmvmCheck/DataHeader/Tab1_Q3"/>
              </td>
              <td align="center" width="11%">
                <xsl:value-of disable-output-escaping="yes" select="EvmvmCheck/DataHeader/Tab1_Q4"/>
              </td>
              <td align="center" width="11%">
                <xsl:value-of disable-output-escaping="yes" select="EvmvmCheck/DataHeader/Tab1_Q5"/>
              </td>
              <td align="center" width="11%">
                <xsl:value-of disable-output-escaping="yes" select="EvmvmCheck/DataHeader/Tab1_Q6"/>
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
            <xsl:for-each select="EvmvmCheck/DataTab1">
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

        <table style="border-collapse:collapse;"  border="1" cellpadding="5" cellspacing="0" width="99%" bordercolor="#000000">
          <caption align="left" >Окончание таблицы 1</caption>
          <thead>
            <tr>
              <td align="center" colspan="6">
                Значения KQ<sub>i</sub> контрольного ПР в точках расхода
              </td>
              <td align="center" colspan="3">Для рабочей жидкости </td>
            </tr>
            <tr>
              <td align="center" width="11%">
                K<sub>Q1</sub>,<br/>имп/м<sup>3</sup>
              </td>

              <td align="center" width="11%">
                K<sub>Q2</sub>,<br/>имп/м<sup>3</sup>
              </td>
              <td align="center" width="11%">
                K<sub>Q3</sub>,<br/>имп/м<sup>3</sup>
              </td>
              <td align="center" width="11%">
                K<sub>Q4</sub>,<br/>имп/м<sup>3</sup>
              </td>
              <td align="center" width="11%">
                K<sub>Q5</sub>,<br/>имп/м<sup>3</sup>
              </td>
              <td align="center" width="11%">
                K<sub>Q6</sub>,<br/>имп/м<sup>3</sup>
              </td>
              <td align="center" width="11%">
                ρ<sub>t</sub>,<br/>кг/м<sup>3</sup>
              </td>
              <td align="center" width="11%">
                β<sub>ж</sub>,<br/>1/ºC
              </td>
              <td align="center" width="11%">
                γ<sub>ж</sub>,<br/>1/МПа
              </td>

            </tr>
            <tr>
              <td align="center" width="11%">6 </td>
              <td align="center" width="11%">7 </td>
              <td align="center" width="11%">8 </td>
              <td align="center" width="11%">9 </td>
              <td align="center" width="11%">10 </td>
              <td align="center" width="11%">10 </td>
              <td align="center" width="11%">11 </td>
              <td align="center" width="11%">12 </td>
              <td align="center" width="11%">13 </td>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="EvmvmCheck/DataTab12">
              <tr>
                <td align="center">
                  <xsl:value-of select="KA1"/>
                </td>
                <td align="center">
                  <xsl:value-of select="KA2"/>
                </td>
                <td align="center">
                  <xsl:value-of select="KA3"/>
                </td>
                <td align="center">
                  <xsl:value-of select="KA4"/>
                </td>
                <td align="center">
                  <xsl:value-of select="KA5"/>
                </td>
                <td align="center">
                  <xsl:value-of select="KA6"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Pt"/>
                </td>
                <td align="center">
                  <xsl:value-of select="B"/>
                </td>
                <td align="center">
                  <xsl:value-of select="G"/>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
        <br/>

        <table style="border-collapse:collapse;"  border="1" cellpadding="5" cellspacing="0" width="86%" bordercolor="#000000">
          <caption align="left" >Таблица 2 - Результаты измерений и вычислений</caption>
          <thead>
            <tr>
              <td align="center" colspan="1" rowspan ="2" width="9%">
                №точ/<br/>№изм
              </td>
              <td align="center" colspan="2">Расход</td>
              <td align="center" colspan="2">ПР<br/>контрольный </td>
              <td align="center" colspan="2">ПР<br/>рабочий</td>
              <td align="center" colspan="1" rowspan ="2" width="11%">
                K<sub>tpji</sub>
              </td>
            </tr>
            <tr>
              <td align="center" width="11%">
                Q<sub>ji</sub>,<br/>м<sup>3</sup>/ч
              </td>
              <td align="center" width="11%">
                <xsl:value-of disable-output-escaping="yes"  select="EvmvmCheck/DataHeader/Tab2_Arg"/>
              </td>
              <td align="center" width="11%">
                t<sub>kji</sub>,<br/>ºC
              </td>
              <td align="center" width="11%">
                P<sub>kji</sub>,<br/>МПа
              </td>
              <td align="center" width="11%">
                t<sub>ПРji</sub>,<br/>ºC
              </td>
              <td align="center" width="11%">
                P<sub>ПРji</sub>,<br/>МПа
              </td>
            </tr>
            <tr>
              <td align="center" width="9%">1</td>
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
            <xsl:for-each select="EvmvmCheck/DataTab2">
              <tr>
                <td align="center">
                  <xsl:value-of select="ji"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Q"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Arg"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Te"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Pe"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Tt"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Pt"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Ktp"/>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
        <br/>

        <table style="border-collapse:collapse;"  border="1" cellpadding="5" cellspacing="0" width="75%" bordercolor="#000000">
          <caption align="left" >Окончание таблицы 2</caption>
          <thead>
            <tr>
              <td align="center" width="9%">
                №/<br/>№изм
              </td>
              <td align="center" width="11%">
                N<sub>kji</sub>,<br/>имп
              </td>
              <td align="center" width="11%">
                N<sub>прji</sub>,<br/>имп
              </td>
              <td align="center" width="11%">
                K<sub>прji</sub>,<br/>имп/м<sup>3</sup>
              </td>
              <td align="center" width="11%">
                K<sub>прj</sub>,<br/>имп/м<sup>3</sup>
              </td>
              <td align="center" width="11%">
                K<sub>пррасчj</sub>,<br/>имп/м<sup>3</sup>
              </td>
              <td align="center" width="11%">
                δ<sub>j</sub>,<br/>%
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
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="EvmvmCheck/DataTab22">
              <tr>
                <td align="center">
                  <xsl:value-of select="ji"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Ne"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Nt"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Kji"/>
                </td>
                <td align="center">
                  <xsl:value-of select="K"/>
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
          Заключение: δmax =&#160;<xsl:value-of select="EvmvmCheck/DataHeader/EVMVM_dKmax"/>%. ПР к дальнейшей эксплуатации (годен, не годен и подлежит внеочередной поверке)
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
          Дата проведения поверки:&#160;<xsl:value-of select="EvmvmCheck/DataHeader/STime"/>
        </div>

      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
