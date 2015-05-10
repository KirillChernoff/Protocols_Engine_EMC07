<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="windows-1251" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">

    <html xmlns="http://www.w3.org/1999/xhtml">

      <head>
        <meta charset="utf-8"/>
        <title>Протокол контроля МХ ПР по поверочной установке</title>
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

        <div align="center">Протокол контроля МХ ПР по поверочной установке</div>
        <br/>
        <table style="table-layout:auto;" border="0" cellpadding="2" cellspacing="0" width="100%">
          <tbody>
            <tr>
              <td align="left" width="10%">Тип ПР:</td>
              <td align="left" width="20%">
                <xsl:value-of select="CpbvmCheck/DataHeader/CurFM_NamTr"/>
              </td>
              <td align="right" width="15%">Заводской №</td>
              <td align="left" width="20%">
                <xsl:value-of select="CpbvmCheck/DataHeader/CurFM_Num"/>
              </td>
              <td align="right" width="15%">Линия №</td>
              <td align="left" width="15%">
                <xsl:value-of select="CpbvmCheck/DataHeader/Len_Num"/>
              </td>
            </tr>
            <tr>
              <td align="left" >Тип ПУ:</td>
              <td align="left" >
                <xsl:value-of select="CpbvmCheck/DataHeader/CPB_NamTr"/>
              </td>
              <td align="right" >Заводской №</td>
              <td align="left" colspan="3">
                <xsl:value-of select="CpbvmCheck/DataHeader/CPB_Num"/>
              </td>
            </tr>
            <tr>
              <td align="left" colspan="6">
                Дата поверки ПУ <xsl:value-of select="CpbvmCheck/DataHeader/CPB_PrDate"/>
              </td>
            </tr>
            <tr>
              <td align="left" colspan="6" width="100%">
                Место проведения КМХ: <xsl:value-of select="CpbvmCheck/DataHeader/Place"/>
              </td>
            </tr>			
            <tr>
              <td align="left" colspan="6">
                Вязкость нефти при КМХ, сСт:<xsl:value-of select="CpbvmCheck/DataHeader/CPB_KVis"/>
              </td>
            </tr>
          </tbody>
        </table>
        <br/>

        <table style="border-collapse:collapse;"  border="1" cellpadding="5" cellspacing="0" width="99%" bordercolor="#000000">
          <caption align="left" >Таблица 1 - Исходные данные</caption>
          <thead>
            <tr>
              <td align="center" colspan="6" >Для поверочной установки (ПУ)</td>
              <td align="center" colspan="3" >Для рабочей жидкости</td>
            </tr>
            <tr>
              <td align="center" width="11%">Детекторы</td>
              <td align="center" width="11%">
                V<sub>o</sub>, м<sup>3</sup>
              </td>
              <td align="center" width="11%">D, мм</td>
              <td align="center" width="11%">S, мм</td>
              <td align="center" width="11%">E, МПа</td>
              <td align="center" width="11%">
                α<sub>t доп</sub>,<br/> 1/ºC
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
              <td align="center" width="11%">1</td>
              <td align="center" width="11%">2</td>
              <td align="center" width="11%">3</td>
              <td align="center" width="11%">4</td>
              <td align="center" width="11%">5</td>
              <td align="center" width="11%">7</td>
              <td align="center" width="11%">8</td>
              <td align="center" width="11%">9</td>
              <td align="center" width="11%">10</td>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="CpbvmCheck/DataTab1">
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
                  <xsl:value-of select="At"/>
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
        
        <table style="border-collapse:collapse;"  border="1" cellpadding="5" cellspacing="0" width="66%" bordercolor="#000000">
          <caption align="left" >Окончание таблицы 1</caption>
          <thead>
            <tr>
              <td align="center" colspan="6" >
                Точки расходов (м<sup>3</sup>/ч) или f/ν (Гц/сСт) для ПР
              </td>
            </tr>
            <tr>
              <td align="center" width="11%">
                Q<sub>1</sub>,<br/>(f/ν)<sub>1</sub>
              </td>
              <td align="center" width="11%">
                Q<sub>2</sub>,<br/>(f/ν)<sub>2</sub>
              </td>
              <td align="center" width="11%">
                Q<sub>3</sub>,<br/>(f/ν)<sub>3</sub>
              </td>
              <td align="center" width="11%">
                Q<sub>4</sub>,<br/>(f/ν)<sub>4</sub>
              </td>
              <td align="center" width="11%">
                Q<sub>5</sub>,<br/>(f/ν)<sub>5</sub>
              </td>
              <td align="center" width="11%">
                Q<sub>6</sub>,<br/>(f/ν)<sub>6</sub>
              </td>
            </tr>
            <tr>
              <td align="center" width="11%">11</td>
              <td align="center" width="11%">12</td>
              <td align="center" width="11%">13</td>
              <td align="center" width="11%">14</td>
              <td align="center" width="11%">15</td>
              <td align="center" width="11%">16</td>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="CpbvmCheck/DataTab2">
              <tr>
                <td align="center">
                  <xsl:value-of select="Q1"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Q2"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Q3"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Q4"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Q5"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Q6"/>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
        <br/>

        <table style="border-collapse:collapse;"  border="1" cellpadding="5" cellspacing="0" width="89%" bordercolor="#000000">
          <caption align="left" >Таблица 2 - Результаты измерений и вычеслений</caption>
          <thead>
            <tr>
              <td align="center" rowspan="2" >
                №пд/<br/>№изм
              </td>

              <td align="center" colspan="2">Расход</td>

              <td align="center" colspan="2">ПУ </td>

              <td align="center" colspan="2">ПР</td>

              <td align="center" rowspan="2" >
                K<sub>tpji</sub>
            </td>
            </tr>
            <tr>
              <td align="center">
                Q<sub>ji</sub>,<br/>м<sup>3</sup>/ч
              </td>
              <td align="center">
                f<sub>ji</sub>,<br/>Гц
              </td>
              <td align="center">
                t<sub>ПУji</sub>,<br/>ºC
              </td>
              <td align="center">
                P<sub>ПУji</sub>,<br/>МПа
              </td>
              <td align="center">
                t<sub>ПРji</sub>,<br/>ºC
              </td>
              <td align="center">
                P<sub>ПРji</sub>,<br/>МПа
              </td>
            </tr>
            <tr>
              <td align="center" width="12%">1 </td>
              <td align="center" width="11%">3 </td>
              <td align="center" width="11%">4 </td>
              <td align="center" width="11%">5 </td>
              <td align="center" width="11%">6 </td>
              <td align="center" width="11%">7 </td>
              <td align="center" width="11%">8 </td>
              <td align="center" width="11%">9 </td>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="CpbvmCheck/DataTab3">
              <tr>
                <td align="center">
                  <xsl:value-of select="ji"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Q"/>
                </td>
                <td align="center">
                  <xsl:value-of select="F"/>
                </td>
                <td align="center">
                  <xsl:value-of select="t"/>
                </td>
                <td align="center">
                  <xsl:value-of select="P"/>
                </td>
                <td align="center">
                  <xsl:value-of select="tpr"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Ppr"/>
                </td>
                <td align="center">
                  <xsl:value-of select="K"/>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
        <br/>

        <table style="border-collapse:collapse;"  border="1" cellpadding="5" cellspacing="0" width="89%" bordercolor="#000000">
          <caption align="left" >Окончание таблицы 2</caption>
          <thead>
            <tr>
              <td align="center">
                №пд/<br/>№изм
              </td>
              <td align="center">
                Детекторы
              </td>
              <td align="center">
                V<sub>ji</sub>, м<sup>3</sup>
              </td>
              <td align="center">
                N<sub>ji</sub>,<br/>имп
              </td>
              <td align="center">
                K<sub>ji</sub>,<br/>имп/м<sup>3</sup>
              </td>
              <td align="center">
                K<sub>j</sub>,<br/>имп/м<sup>3</sup>
              </td>
              <td align="center" >
                K<sub>расчj</sub>,<br/>имп/м<sup>3</sup>
              </td>
              <td align="center">
                δ<sub>j</sub>,<br/>%
              </td>
            </tr>
            <tr>
              <td align="center" width="12%">1</td>
              <td align="center" width="11%">10</td>
              <td align="center" width="11%">12</td>
              <td align="center" width="11%">13</td>
              <td align="center" width="11%">14</td>
              <td align="center" width="11%">15</td>
              <td align="center" width="11%">16</td>
              <td align="center" width="11%">17</td>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="CpbvmCheck/DataTab4">
              <tr>
                <td align="center">
                  <xsl:value-of select="ji"/>
                </td>
                <td align="center">
                  <xsl:value-of select="DtNam"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Vo"/>
                </td>
                <td align="center">
                  <xsl:value-of select="N"/>
                </td>
                <td align="center">
                  <xsl:value-of select="K"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Kj"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Kr"/>
                </td>
                <td align="center">
                  <xsl:value-of select="D"/>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
        <br/>

        <div>
          Заключение: δmax =&#160;<xsl:value-of select="CpbvmCheck/DataHeader/CPB_dKmax"/>%. ПР годен к дальнейшей эксплуатации (не годен и подлежит внеочередной поверке)
        </div>
        <br/>
        <div>
          Дата проведения поверки:&#160;<xsl:value-of select="CpbvmCheck/DataHeader/STime"/>
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

      </body>
    </html>

  </xsl:template>
</xsl:stylesheet>
