<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="windows-1251" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">

    <html xmlns="http://www.w3.org/1999/xhtml">

      <head>
        <meta charset="utf-8"/>
        <title>Поверка СРМ с помощью ЭСРМ по МИ 3313-2011</title>
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
        <div align="center">ПРОТОКОЛ № <xsl:value-of select="EmmmmVerification/DataHeader/ProtN"/></div>
        <div align="center">поверки СРМ с помощью ЭСРМ по МИ 3313-2011</div>
        <br/>

        <table style="table-layout:auto;" border="0" cellpadding="2" cellspacing="0" width="100%">
          <tbody>
            <tr>
              <td align="left" colspan="6" width="100%">
                Место проведения поверки: <xsl:value-of select="EmmmmVerification/DataHeader/Place"/>
              </td>
            </tr>
            <tr>
              <td align="left" width="5%"> СРМ</td>
              <td align="left" width="20%">Тип датчика:</td>
              <td align="left" width="15%">
                <xsl:value-of select="EmmmmVerification/DataHeader/CurFM_NamTr"/>
              </td>
              <td align="left" width="15%">Заводской №</td>
              <td align="left" width="20%">
                <xsl:value-of select="EmmmmVerification/DataHeader/CurFM_Num"/>
              </td>
              <td align="right" width="15%">Линия №</td>
              <td align="left" width="20%">
                <xsl:value-of select="EmmmmVerification/DataHeader/Len_Num"/>
              </td>
            </tr>
            <tr>
              <td align="left" width="5%"> </td>
              <td align="left" width="20%">Тип преобразавателя:</td>
              <td align="left" width="15%">
                <xsl:value-of select="EmmmmVerification/DataHeader/CurFM_NamTr1"/>
              </td>
              <td align="left" width="15%">Заводской №</td>
              <td align="left" width="20%">
                <xsl:value-of select="EmmmmVerification/DataHeader/CurFM_Num1"/>
              </td>
            </tr>
            <tr>
              <td align="left" width="5%">ЭСРМ</td>
              <td align="left" width="20%">Тип датчика:</td>
              <td align="left" width="15%">
                <xsl:value-of select="EmmmmVerification/DataHeader/EFM_NamTr"/>
              </td>
              <td align="left" width="15%">Заводской №</td>
              <td align="left" width="20%">
                <xsl:value-of select="EmmmmVerification/DataHeader/EFM_Num"/>
              </td>
            </tr>
            <tr>
              <td align="left" width="5%"> </td>
              <td align="left" width="20%">Тип преобразавателя:</td>
              <td align="left" width="15%">
                <xsl:value-of select="EmmmmVerification/DataHeader/EFM_NamTr1"/>
              </td>
              <td align="left" width="15%">Заводской №</td>
              <td align="left" width="20%">
                <xsl:value-of select="EmmmmVerification/DataHeader/EFM_Num1"/>
              </td>
            </tr>
            <tr>
              <td align="left" width="5%">Тип ИВК:</td>
              <td align="left" width="20%">
                <xsl:value-of select="EmmmmVerification/DataHeader/IVK_NamTr"/>
              </td>
              <td align="left" width="15%"></td>
              <td align="left" width="15%">Заводской №</td>
              <td align="left" width="20%">
                <xsl:value-of select="EmmmmVerification/DataHeader/IVK_Num"/>
              </td>
            </tr>
            <tr>
              <td align="left" colspan="6" >
                Рабочая жидкость:&#160;<xsl:value-of select="EmmmmVerification/DataHeader/Prod_Name"/>
              </td>
            </tr>
          </tbody>
        </table>
        <br/>

        <table style="border-collapse:collapse;"  border="1" cellpadding="5" cellspacing="0" width="88%" bordercolor="#000000">
          <caption align="left" >Таблица 1 - Исходные данные</caption>
          <thead>
            <tr>
              <td align="center" width="11%">δ<sub>Э</sub>,<br/>%</td>
              <td align="center" width="11%">K<sub>ПМЭ</sub>,<br/>имп/т</td>
              <td align="center" width="11%">δ<sub>ИВК</sub>,<br/>%</td>
              <td align="center" width="11%">K<sub>ПМ</sub>,<br/>имп/т</td>
              <td align="center" width="11%">
			   <xsl:value-of disable-output-escaping="yes" select="EmmmmVerification/DataHeader/Tab1HeadKMod"/>
              </td>
              <td align="center" width="11%">Q<sub>Мmax</sub>,<br/>имп/т</td>
              <td align="center" width="11%">ZS</td>
              <td align="center" width="11%">Q<sub>НОМ</sub>,<br/>т/ч</td>

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
            <xsl:for-each select="EmmmmVerification/DataTab1">
              <tr>
                <td align="center">
                  <xsl:value-of select="de"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Kpme"/>
                </td>
                <td align="center">
                  <xsl:value-of select="dIvk"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Kpm"/>
                </td>
                <td align="center">
                  <xsl:value-of select="KMod"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Qmax"/>
                </td>
                <td align="center">
                  <xsl:value-of select="ZS"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Qnom"/>
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
              <td align="center" width="11%">
                δ<sub>tдоп</sub>,<br/>%/ºC
              </td>
              <td align="center" width="11%">
                δ<sub>Pдоп</sub>,<br/>%/0,1МПа
              </td>
              <td align="center" width="11%">
                t<sub>min</sub>,<br/>ºC
              </td>
              <td align="center" width="11%">
                t<sub>max</sub>,<br/>ºC
              </td>
              <td align="center" width="11%">
                P<sub>min</sub>,<br/>МПа
              </td>
              <td align="center" width="11%">
                P<sub>max</sub>,<br/>МПа
              </td>
            </tr>

            <tr>
              <td align="center" width="11%">9</td>
              <td align="center" width="11%">10</td>
              <td align="center" width="11%">11</td>
              <td align="center" width="11%">12</td>
              <td align="center" width="11%">13</td>
              <td align="center" width="11%">14</td>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="EmmmmVerification/DataTab12">
              <tr>
                <td align="center">
                  <xsl:value-of select="dt"/>
                </td>
                <td align="center">
                  <xsl:value-of select="dp"/>
                </td>
                <td align="center">
                  <xsl:value-of select="tmin"/>
                </td>
                <td align="center">
                  <xsl:value-of select="tmax"/>
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
              <td align="center" width="11%">№точ/<br/>№изм</td>
              <td align="center" width="11%">Q<sub>ji</sub>,<br/>т/ч</td>
              <td align="center" width="11%">T<sub>ji</sub>,<br/>c</td>
              <td align="center" width="11%">N<sub>Эji</sub>,<br/>имп</td>
              <td align="center" width="11%">N<sub>ji</sub>,<br/>имп</td>
              <td align="center" width="11%">M<sub>Эji</sub>,<br/>т</td>
              <td align="center" width="11%">M<sub>ji</sub>,<br/>т</td>
              <td align="center" width="11%">
					<xsl:value-of disable-output-escaping="yes" select="EmmmmVerification/DataHeader/Tab2HeadKMod"/>
              </td>
            </tr>
            <tr>
              <th align="center" width="11%">1 </th>
              <th align="center" width="11%">2 </th>
              <th align="center" width="11%">3 </th>
              <th align="center" width="11%">4 </th>
              <th align="center" width="11%">5 </th>
              <th align="center" width="11%">6 </th>
              <th align="center" width="11%">7 </th>
              <th align="center" width="11%">8 </th>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="EmmmmVerification/DataTab2">
              <tr>
                <td align="center">
                  <xsl:value-of select="ji"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Qji"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Tji"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Neji"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Ntji"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Meji"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Mtji"/>
                </td>
                <td align="center">
                  <xsl:value-of select="KModji"/>
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
              <td align="center" width="11%">№ точ</td>
              <td align="center" width="11%">Q<sub>j</sub>,<br/>т/ч</td>
              <td align="center" width="11%">
					<xsl:value-of disable-output-escaping="yes" select="EmmmmVerification/DataHeader/Tab3HeadKMod"/>
              </td>
              <td align="center" width="11%">n<sub>j</sub></td>
              <td align="center" width="11%">S<sub>j</sub>,<br/>%</td>
              <td align="center" width="11%">S<sub>0j</sub>,<br/>%</td>
              <td align="center" width="11%">t<sub>0,95j</sub></td>
              <td align="center" width="11%">ε<sub>j</sub>,<br/>%</td>
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
            <xsl:for-each select="EmmmmVerification/DataTab3">
              <tr>
                <td align="center">
                  <xsl:value-of select="j"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Qj"/>
                </td>
                <td align="center">
                  <xsl:value-of select="KModj"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Nmj"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Sj"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Soj"/>
                </td>
                <td align="center">
                  <xsl:value-of select="t095j"/>
                </td>
                <td align="center">
                  <xsl:value-of select="ej"/>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
        <br/>

        <table style="border-collapse:collapse;"  border="1" cellpadding="5" cellspacing="0" width="88%" bordercolor="#000000">
          <caption align="left" >Таблица 4 - Результаты поверки в диапазоне</caption>
          <thead>
            <tr>
              <td align="center" width="11%">
                Q<sub>min</sub>,<br/>т/ч
              </td>
              <td align="center" width="11%">
                Q<sub>max</sub>,<br/>т/ч
              </td>
              <td align="center" width="11%">
					<xsl:value-of disable-output-escaping="yes" select="EmmmmVerification/DataHeader/Tab4HeadKMod"/>
              </td>
              <td align="center" width="11%">
                S<sub>0</sub>,<br/>%
              </td>
              <td align="center" width="11%">
                ε,<br/>%
              </td>
              <td align="center" width="11%">
                θ<sub>A</sub>,<br/>%
              </td>
              <td align="center" width="11%">
                θ<sub>Z</sub>,<br/>%
              </td>
              <td align="center" width="11%">
                t<sub>П</sub>,<br/>ºC
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
            <xsl:for-each select="EmmmmVerification/DataTab4">
              <tr>
                <td align="center">
                  <xsl:value-of select="Qmin"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Qmax"/>
                </td>
                <td align="center">
                  <xsl:value-of select="KMod"/>
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
                  <xsl:value-of select="Tt"/>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
        <br/>
        
        <table style="border-collapse:collapse;"  border="1" cellpadding="5" cellspacing="0" width="55%" bordercolor="#000000">
          <caption align="left">Окончание таблицы 4</caption>
          <thead>
            <tr>
              <td align="center" width="11%">
                θ<sub>Mt</sub>,<br/>%
              </td>
              <td align="center" width="11%">
                P<sub>П</sub>,<br/>МПа
              </td>
              <td align="center" width="11%">
                θ<sub>MP</sub>,<br/>%
              </td>
              <td align="center" width="11%">
                θ<sub>Σ</sub>,<br/>%
              </td>
              <td align="center" width="11%">
                δ,<br/>%
              </td>
            </tr>

            <tr>
              <td align="center" width="11%">9 </td>
              <td align="center" width="11%">10 </td>
              <td align="center" width="11%">11</td>
              <td align="center" width="11%">12</td>
              <td align="center" width="11%">13</td>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="EmmmmVerification/DataTab4">
              <tr>
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
              <td align="left" width="50%">
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
          Дата проведения поверки:&#160;<xsl:value-of select="EmmmmVerification/DataHeader/STime"/>
        </div>

      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
